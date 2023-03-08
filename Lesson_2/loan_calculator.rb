# m = p * (j / (1 - (1 + j)**(-n)))
# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months

def prompt(text)
  puts "=> #{text}"
end

def valid?(num)
  num.to_i.to_s == num || num.to_f.to_s == num
end

def calc(loan, interest, duration)
  loan * (interest / (1 - (1 + interest)**(-(duration))))
end

prompt "This is a loan calculator used to determine your monthly payments,"
prompt "total payment amount, and total interest value."

loop do
  while true
    prompt "Please state the value of the loan in plain digits e.g."
    prompt "'£10000' = 10000"
    loan_value = gets.chomp
    prompt loan_value + " in your local currency." if valid?(loan_value)
    valid?(loan_value) ? break : prompt("You must put a VALID number")
  end

  loan_amount = loan_value.to_f

  while true
    prompt "Please state the loan duration in years rounded down"
    prompt "e.g '12 years and 11 months' = 12"
    prompt "Years remaining:"
    years = gets.chomp
    prompt years + " years." if valid?(years)
    valid?(years) ? break : prompt("You must put a VALID number")
  end

  while true
    prompt "Please state any additional months remaining on your loan duration"
    prompt "e.g. '12 years and 11 months' = 11"
    prompt "Months remaining:"
    months = gets.chomp
    prompt months + " months." if valid?(months)
    valid?(months) ? break : prompt("You must put a VALID number")
  end

  prompt "Total loan duration is #{years} years and #{months} months."

  loan_duration = (years.to_i * 12) + months.to_i

  while true
    prompt "What is your annual percentage rate? e.g '5%' = 5"
    apr = gets.chomp
    prompt apr + "% APR" if valid?(apr)
    valid?(apr) ? break : prompt("You must put a VALID number")
  end

  puts ""

  monthly_interest = (apr.to_f / 12.0) / 100 # divide by 100 to get the
  # appropriate decimal value for arithmetic

  payments = calc(loan_amount, monthly_interest, loan_duration)

  prompt "Calculating..."
  prompt "Your monthly payment amount is #{payments.round(2)}."
  prompt "Your total payment amount is #{payments.round(2) * loan_duration}."
  prompt "The total interest on your loan is #{((payments.round(2) *
  loan_duration) - loan_amount).round(2)}."
  prompt "Thanks for using the calculator; would you like to make another"
  prompt "calculation? (y/n)"
  input = gets.chomp
  break if input != "Y".downcase
end

prompt "Goodbye."
