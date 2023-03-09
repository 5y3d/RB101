def prompt(text)
  puts "=> #{text}"
end

def valid_money?(num) # this validates the currency input
  (num.to_i.to_s == num || num.to_f.to_s == num) && num.to_f >= 0.1
end

def valid_number?(num) # this validates time and APR inputs
  (num.to_i.to_s == num || num.to_f.to_s == num) && num.to_f >= 0.0
end

def interest_calculator(loan, interest, duration)
  loan * (interest / (1 - (1 + interest)**(-(duration))))
end

def user_input_loan_amount()
  while true
    prompt "Please state the value of the loan in plain digits e.g."
    prompt "'£10000' = 10000"
    loan_value = gets.chomp
    if valid_money?(loan_value) 
      prompt "#{loan_value}.00 in your local currency."
      return loan_value.to_f
    else
      prompt "You must put a VALID number"
    end
  end
end

def user_input_years()
  while true
    prompt "Please state the loan duration in years rounded down"
    prompt "e.g '12 years and 11 months' = 12"
    prompt "Years remaining:"
    years = gets.chomp
    if valid_number?(years) 
      prompt "#{years.to_i} years."
      return years.to_i
    else
      prompt("You must put a VALID number")
    end
  end
end

def user_input_months()
  while true
    prompt "Please state any additional months remaining on your loan duration"
    prompt "e.g. '12 years and 11 months' = 11"
    prompt "Months remaining:"
    months = gets.chomp
    if valid_number?(months) 
      prompt "#{months.to_i} months."
      return months.to_i
    else
      prompt("You must put a VALID number")
    end
  end
end

def user_input_apr()
  while true
    prompt "What is your annual percentage rate? e.g '5%' = 5"
    apr = gets.chomp
    if valid_number?(apr)
      prompt "#{apr}%"
      return apr.to_f
    else
      prompt "invalid input, please put a valid number."
    end
  end
end

def display_final_results(monthly_payments_var, loan_duration_var, loan_amount_var)
  prompt "Calculating..."
  prompt "Your monthly payment amount is #{monthly_payments_var.round(2)}."
  prompt "Your total payment amount is #{(monthly_payments_var * loan_duration_var).round(2)}."
  prompt "The total interest on your loan is #{((monthly_payments_var.round(2) *
  loan_duration_var) - loan_amount_var).round(2).abs}."
end
  
prompt "This is a loan calculator used to determine your monthly payments,"
prompt "total payment amount, and total interest value."

loop do
  loan_amount = user_input_loan_amount()

  while true
    total_years = user_input_years
    total_months = user_input_months
    if total_years + total_months > 0
      break
    else
      prompt "both years and months cannot be 0, please input a valid time frame"
    end
  end

  prompt "Total loan duration is #{total_years} years and #{total_months} months."
  loan_duration = (total_years * 12) + total_months

  yearly_interest = user_input_apr

  puts ""

  monthly_interest = (yearly_interest / 12.0) / 100 # divide by 100 to get the
  # appropriate decimal value for arithmetic

  monthly_payments = interest_calculator(loan_amount, monthly_interest, loan_duration)

  display_final_results(monthly_payments, loan_duration, loan_amount)
  
  prompt "Thanks for using the calculator; would you like to make another"
  prompt "calculation? (y/n)"
  input = gets.chomp
  break if input.downcase != "y"
end

prompt "Goodbye."
