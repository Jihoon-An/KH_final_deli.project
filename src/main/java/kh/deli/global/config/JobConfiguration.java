package kh.deli.global.config;

import kh.deli.domain.owner.service.OwnerBatchService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.batch.core.*;
import org.springframework.batch.core.configuration.annotation.EnableBatchProcessing;
import org.springframework.batch.core.configuration.annotation.JobBuilderFactory;
import org.springframework.batch.core.configuration.annotation.StepBuilderFactory;
import org.springframework.batch.core.launch.JobLauncher;
import org.springframework.batch.repeat.RepeatStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.Scheduled;

import java.util.HashMap;
import java.util.Map;

@Slf4j // log 사용을 위한 lombok 어노테이션
@RequiredArgsConstructor  // 생성자 DI를 위한 lombok 어노테이션
@EnableBatchProcessing
@Configuration
public class JobConfiguration {

    private final JobBuilderFactory jobBuilderFactory; // 생성자 DI 받음
    private final StepBuilderFactory stepBuilderFactory; // 생성자 DI 받음
    private final OwnerBatchService ownerBatchService;
    private final JobLauncher jobLauncher;

    @Scheduled(cron = "0 0 5 * * *") //초분시일월주년
    public void runJob(){
        log.info("스케줄러 가동");
        Map<String, JobParameter> param = new HashMap<>();
        param.put("time", new JobParameter(System.currentTimeMillis()));
        JobParameters jobParameters = new JobParameters(param);
        try{
            jobLauncher.run(Job(), jobParameters);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    @Bean
    public Job Job() {
        return (Job) jobBuilderFactory.get("Job")
                .start(executeDDSales())
                    .on("FAILED")
                    .to(errorLog())
                    .on("*")
                    .end()
                .from(executeDDSales())
                    .on("COMPLETED")
                    .end()
                .end()
                .build();
    }

    @Bean
    public Step executeDDSales() {
        return stepBuilderFactory.get("executeDDSales")
                .tasklet((contribution, chunkContext) -> {
                    String result = ownerBatchService.executeDailySales();

                    log.info(">>>>> This is Step1");

                    System.out.println(result);
                    if("SUCCESS".equals(result)){
                        contribution.setExitStatus(ExitStatus.COMPLETED);
                    }else{
                        contribution.setExitStatus(ExitStatus.FAILED);
                    }

                    return RepeatStatus.FINISHED;
                })
                .build();
    }

    @Bean
    public Step errorLog(){
        return stepBuilderFactory.get("nextStep")
                .tasklet((contribution, chunkContext) -> {
                    log.info(">>>>>FailOver Step!");
                    // TODO: 2022-12-21  result값으로 받아온 에러코드 출력하고 retry 해보기
                    return RepeatStatus.FINISHED;
                })
                .build();
    }



}
