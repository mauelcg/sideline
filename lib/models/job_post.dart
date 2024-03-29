class JobPost {
  String? jobId;
  String? employerName;
  String? employerLogo;
  String? jobTitle;
  String? jobDescription;
  String? jobCity;
  String? jobState;
  String? jobCountry;
  Map<String, dynamic>? jobHighlights;
  // String? employerWebsite;
  // String? employerCompanyType;
  // String? jobPublisher;
  // String? jobEmploymentType;
  // String? jobApplyLink;
  // bool? jobApplyIsDirect;
  // double? jobApplyQualityScore;
  // List<Map<String, dynamic>>? applyOptions;
  // bool? jobIsRemote;
  // int? jobPostedAtTimestamp;
  // String? jobPostedAtDateTimeUtc;
  // double? jobLatitude;
  // double? jobLongitude;
  // List<String>? jobBenefits;
  // String? jobGoogleLink;
  // String? jobOfferExpirationTimestamp;
  // Map<String, dynamic>? jobRequiredExperience;
  // List<String>? jobRequiredSkills;
  // Map<String, dynamic>? jobRequiredEducation;
  // bool? jobExperienceInPlaceOfEducation;
  // double? jobMinSalary;
  // double? jobMaxSalary;
  // String? jobSalaryCurrency;
  // String? jobSalaryPeriod;
  // String? jobJobTitle;
  // String? jobPostingLanguage;
  // String? jobOnetSoc;
  // String? jobOnetJobZone;

  JobPost({
    this.jobId,
    this.employerName,
    this.employerLogo,
    this.jobTitle,
    this.jobDescription,
    this.jobCity,
    this.jobState,
    this.jobCountry,
    this.jobHighlights,
    // this.employerWebsite,
    // this.employerCompanyType,
    // this.jobPublisher,
    // this.jobEmploymentType,
    // this.jobApplyLink,
    // this.jobApplyIsDirect,
    // this.jobApplyQualityScore,
    // this.applyOptions,
    // this.jobIsRemote,
    // this.jobPostedAtTimestamp,
    // this.jobPostedAtDateTimeUtc,
    // this.jobLatitude,
    // this.jobLongitude,
    // this.jobBenefits,
    // this.jobGoogleLink,
    // this.jobOfferExpirationTimestamp,
    // this.jobRequiredExperience,
    // this.jobRequiredSkills,
    // this.jobRequiredEducation,
    // this.jobExperienceInPlaceOfEducation,
    // this.jobMinSalary,
    // this.jobMaxSalary,
    // this.jobSalaryCurrency,
    // this.jobSalaryPeriod,
    // this.jobJobTitle,
    // this.jobPostingLanguage,
    // this.jobOnetSoc,
    // this.jobOnetJobZone,
  });

  JobPost.fromJson(Map<String, dynamic> json) {
    jobId = json['job_id'];
    employerName = json['employer_name'];
    employerLogo = json['employer_logo'];
    jobTitle = json['job_title'];
    jobDescription = json['job_description'];
    jobCity = json['job_city'];
    jobState = json['job_state'];
    jobCountry = json['job_country'];
    jobHighlights = json['job_highlights'];
    // employerWebsite = json['employer_website'];
    // employerCompanyType = json['employer_company_type'];
    // jobPublisher = json['job_publisher'];
    // jobEmploymentType = json['job_employment_type'];
    // jobApplyLink = json['job_apply_link'];
    // jobApplyIsDirect = json['job_apply_is_direct'];
    // jobApplyQualityScore = json['job_apply_quality_score'];
    // applyOptions = json['apply_options'];
    // jobIsRemote = json['job_is_remote'];
    // jobPostedAtTimestamp = json['job_posted_at_timestamp'];
    // jobPostedAtDateTimeUtc = json['job_posted_at_datetime_utc'];
    // jobLatitude = json['job_lattitude'];
    // jobLongitude = json['job_longitude'];
    // jobBenefits = json['job_benefits'];
    // jobGoogleLink = json['job_google_link'];
    // jobOfferExpirationTimestamp = json['job_offer_expiration_timestamp'];
    // jobRequiredExperience = json['job_required_experience'];
    // jobRequiredSkills = json['job_required_skills'];
    // jobRequiredEducation = json['job_required_education'];
    // jobExperienceInPlaceOfEducation = json['job_experience_in_place_of_education'];
    // jobMinSalary = json['job_min_salary'];
    // jobMaxSalary = json['job_max_salary'];
    // jobSalaryCurrency = json['job_salary_currency'];
    // jobSalaryPeriod = json['job_salary_period'];
    // jobJobTitle = json['job_job_title'];
    // jobPostingLanguage = json['job_posting_language'];
    // jobOnetSoc = json['job_onet_soc'];
    // jobOnetJobZone = json['job_onet_job_zone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['job_id'] = jobId;
    data['employer_name'] = employerName;
    data['employer_logo'] = employerLogo;
    data['job_title'] = jobTitle;
    data['job_description'] = jobDescription;
    data['job_city'] = jobCity;
    data['job_state'] = jobState;
    data['job_country'] = jobCountry;
    data['job_highlights'] = jobHighlights;
    // data['employer_website'] = employerWebsite;
    // data['employer_company_type'] = employerCompanyType;
    // data['job_publisher'] = jobPublisher;
    // data['job_employment_type'] = jobEmploymentType;
    // data['job_apply_link'] = jobApplyLink;
    // data['job_apply_is_direct'] = jobApplyIsDirect;
    // data['job_apply_quality_score'] = jobApplyQualityScore;
    // data['apply_options'] = applyOptions;
    // data['job_is_remote'] = jobIsRemote;
    // data['job_posted_at_timestamp'] = jobPostedAtTimestamp;
    // data['job_posted_at_datetime_utc'] = jobPostedAtDateTimeUtc;
    // data['job_lattitude'] = jobLatitude;
    // data['job_longitude'] = jobLongitude;
    // data['job_benefits'] = jobBenefits;
    // data['job_google_link'] = jobGoogleLink;
    // data['job_offer_expiration_timestamp'] = jobOfferExpirationTimestamp;
    // data['job_required_experience'] = jobRequiredExperience;
    // data['job_required_skills'] = jobRequiredSkills;
    // data['job_required_education'] = jobRequiredEducation;
    // data['job_experience_in_place_of_education'] = jobExperienceInPlaceOfEducation;
    // data['job_min_salary'] = jobMinSalary;
    // data['job_max_salary'] = jobMaxSalary;
    // data['job_salary_currency'] = jobSalaryCurrency;
    // data['job_salary_period'] = jobSalaryPeriod;
    // data['job_job_title'] = jobJobTitle;
    // data['job_posting_language'] = jobPostingLanguage;
    // data['job_onet_soc'] = jobOnetSoc;
    // data['job_onet_job_zone'] = jobOnetJobZone;

    return data;
  }
}
