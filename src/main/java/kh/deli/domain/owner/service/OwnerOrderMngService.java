package kh.deli.domain.owner.service;

import com.google.gson.Gson;
import kh.deli.domain.member.store.dto.Basket;
import kh.deli.domain.member.store.dto.BasketDTO;
import kh.deli.domain.member.store.service.StoreBasketService;
import kh.deli.domain.owner.dto.OwnerOrderMngRequestDTO;
import kh.deli.domain.owner.dto.OwnerOrderMngResponseDTO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@AllArgsConstructor
public class OwnerOrderMngService {
    private final OwnerOrdersService ordersService;
    private final StoreBasketService basketService;

    private final Gson gson;

    public List<OwnerOrderMngResponseDTO> getOrderMngResponseDTO(int storeSeq) {
        List<OwnerOrderMngRequestDTO> orderMngReqList = ordersService.getOrderMngList(storeSeq);

        List<OwnerOrderMngResponseDTO> orderMngList = new ArrayList<>();

        for (OwnerOrderMngRequestDTO orderMngReq : orderMngReqList) {
            String address = orderMngReq.getAdd_detail1() + " " + orderMngReq.getAdd_detail2();
            String link = "preset link" + orderMngReq.getOrder_seq();

            BasketDTO basketDto = gson.fromJson(orderMngReq.getMenu_list(), BasketDTO.class);
            Basket basket = basketService.basketDtoToObject(basketDto);



            List<String> menuStrList = new ArrayList<>();//////////

            orderMngList.add(
                    OwnerOrderMngResponseDTO.builder()
                            .orderSeq(orderMngReq.getOrder_seq())
                            .status(orderMngReq.getOrder_status())
                            .memberName(orderMngReq.getMem_name())
                            .menuStrList(menuStrList)
                            .address(address)
                            .phone(orderMngReq.getMem_phone())
                            .link(link)
                            .build()
            );
        }

        return orderMngList;
    }
}
