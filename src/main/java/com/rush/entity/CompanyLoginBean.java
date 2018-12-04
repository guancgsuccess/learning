package com.rush.entity;

import lombok.*;

import java.util.Date;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class CompanyLoginBean {

	private String companyEmail;

	private String companyPassword;

	private Integer companyVerify;

	private Date companyTime;

	private Integer companyStatus;

}
