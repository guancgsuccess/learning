package com.rush.service;

import com.rush.entity.Company;
import com.rush.entity.User;

public interface RegisterService {
    boolean userRegister(User user);

    boolean companyRegister(Company company);
}
