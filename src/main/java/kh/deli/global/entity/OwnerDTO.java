<<<<<<< HEAD
<<<<<<< HEAD
package kh.deli.global.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
=======
package kh.deli.global.entity;

import lombok.AllArgsConstructor;
>>>>>>> 42e1269 (refactor:entity DTO 수정)
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
<<<<<<< HEAD
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OwnerDTO {
    private Integer owner_seq;
    private Integer acc_seq;
=======
@NoArgsConstructor
@AllArgsConstructor
public class OwnerDTO {
    private int owner_seq;
    private int acc_seq;
>>>>>>> 42e1269 (refactor:entity DTO 수정)
    private String owner_name;
    private String owner_phone;
    private String owner_num;
    private String owner_card_img;
<<<<<<< HEAD
=======
package kh.deli.global.entity;public class OwnerDTO {
>>>>>>> 40a1771 (feat:entity DTO 신규등록)
=======
>>>>>>> 42e1269 (refactor:entity DTO 수정)
}
