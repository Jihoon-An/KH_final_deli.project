package kh.deli.domain.main.repository;

import kh.deli.domain.main.mapper.OwnerSignUpMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OwnerRepository {

    @Autowired
    private OwnerSignUpMapper ownerSignUpMapper;


}
