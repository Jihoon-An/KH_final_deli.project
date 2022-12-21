package kh.deli.domain.member.store.service;

import com.google.gson.Gson;
import kh.deli.domain.member.store.mapper.StoreMenuOptionMapper;
import kh.deli.global.entity.MenuOptionDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
@AllArgsConstructor
public class StoreMenuOptionService {

    private final StoreMenuOptionMapper optionMapper;
    private final Gson gson;

    public List<MenuOptionDTO> findByMenuSeq(int menuSeq) {
        Optional<List<MenuOptionDTO>> optionalMenuDTO = Optional.ofNullable(optionMapper.findByMenuSeq(menuSeq));
        return optionalMenuDTO.orElse(new ArrayList<>());
    }

    /**
     * @return Map<option_group, options>
     */
    public Map<String, List<Map<String, Object>>> toMap(List<MenuOptionDTO> options) {

        Map<String, List<Map<String, Object>>> optionGroupMap = new HashMap<>();

        for (MenuOptionDTO option : options) {

            if (optionGroupMap.containsKey(option.getOption_group())) {
                //이미 그룹이 있으면
                Map<String, Object> optionMap = new HashMap<>();
                optionMap.put("object", option);
                optionMap.put("json", gson.toJson(option));

                optionGroupMap.get(option.getOption_group()).add(optionMap);
            } else {
                //그룹이 없으면
                List<Map<String, Object>> newOptionArr = new ArrayList<>();

                Map<String, Object> optionMap = new HashMap<>();
                optionMap.put("object", option);
                optionMap.put("json", gson.toJson(option));

                newOptionArr.add(optionMap);

                optionGroupMap.put(option.getOption_group(), newOptionArr);
            }
        }

        return optionGroupMap;
    }
}
