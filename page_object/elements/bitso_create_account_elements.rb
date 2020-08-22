module BitsoCreateAccountElements

  FIELDS ||= {
      residence_country: '#registerCountrySelector',
      email: '#email',
      password: '#password'
  }.freeze

  BUTTONS ||= {
  }.freeze

  DROPDOWNS ||= {
    residence_country: '//*[@id="root"]/div/div[2]/div[2]/div/form/div[1]/div/div/div[2]/div'
  }.freeze

  CHECKBOXES ||= {
      accept_terms: 'label[for=accept_terms]',
      accept_news: '//*[contains(text(),"Quiero recibir")]',
      accept_privacy_policy: 'label[for=privacyCheckbox]'

  }.freeze

  MESSAGES ||= {
      email_error_message: '//*[contains(text(),"El email es inválido")]',
      password_error_message: '//*[contains(text(),"Mín. 8 carácteres con números y símbolos")]',
  }

  SPAN ||= {

  }.freeze

  # error messages in span
  SPAN_ERRORS ||= {

  }
end
