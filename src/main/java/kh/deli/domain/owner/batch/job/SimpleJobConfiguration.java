//package kh.deli.domain.owner.batch.job;
//
//import kh.deli.domain.owner.service.OwnerBatchService;
//import lombok.RequiredArgsConstructor;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.batch.core.Job;
//import org.springframework.batch.core.JobExecution;
//import org.springframework.batch.core.Step;
//import org.springframework.batch.core.StepExecution;
//import org.springframework.batch.core.configuration.annotation.JobBuilderFactory;
//import org.springframework.batch.core.configuration.annotation.StepBuilderFactory;
//import org.springframework.batch.core.job.flow.FlowExecutionStatus;
//import org.springframework.batch.core.job.flow.JobExecutionDecider;
//import org.springframework.batch.repeat.RepeatStatus;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//
//@Slf4j // log 사용을 위한 lombok 어노테이션
//@RequiredArgsConstructor  // 생성자 DI를 위한 lombok 어노테이션
//@Configuration
//public class SimpleJobConfiguration {
//
//    private final JobBuilderFactory jobBuilderFactory; // 생성자 DI 받음
//    private final StepBuilderFactory stepBuilderFactory; // 생성자 DI 받음
//    private final OwnerBatchService ownerBatchService;
//
//    @Bean
//    public Job simpleJob() {
//        return (Job) jobBuilderFactory.get("simpleJob")
//                .start(simpleStep1())
//                .next(decider())
//                .build();
//    }
//
//    @Bean
//    public Step simpleStep1() {
//        return stepBuilderFactory.get("simpleStep1")
//                .tasklet((contribution, chunkContext) -> {
//                    log.info(">>>>> This is Step1");
//                    return RepeatStatus.FINISHED;
//                })
//                .build();
//    }
//
//    @Bean
//    public JobExecutionDecider decider(){
//        return new SuccessMsg();
//    }
//
//    public static class SuccessMsg implements JobExecutionDecider{
//        @Override
//        public FlowExecutionStatus decide(JobExecution jobExecution, StepExecution stepExecution) {
//            String returnmsg= "";
//
////            ownerBatchService.executeDailySales();
//
//            return new FlowExecutionStatus(returnmsg);
//        }
//    }
//}
