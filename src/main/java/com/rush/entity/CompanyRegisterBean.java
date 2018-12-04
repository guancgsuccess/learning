package com.rush.entity;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class CompanyRegisterBean {
	private Integer companyId;

	private String companyName;

	private String companyPassword;

	private String companyAddress;

	private String companyRegistrationCode;

	private String companyLegalRepresentative;

	private String companyPhone;

	private String companyType;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date companyRegisterTime;

	private String companyEmail;

	private String companyIntroduction;

	private Integer companyStatus;

	private String companySpare;

	private String registerValidCode;

}
