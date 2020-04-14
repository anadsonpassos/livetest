Dado(/^que eu esteja na home do site$/) do
    # se ENV['env'] for igual a nulo, então @profile_loja = 'DEV', senão @profile_loja = ENV['env']
    ENV['env'] == nil ? @profile_loja = 'HOM' : @profile_loja = ENV['env']
   
    puts " >> RUN PROFILE: " + @profile_loja
   
    case @profile_loja  
      when "CI"  
        visit ENVIRONMENT['HOME']['CI']['url'].gsub('{store_id}',@store_id.downcase)
      when "HOM"
        visit ENVIRONMENT['HOME']['HOM']['url'].gsub('{store_id}',@store_id.downcase)
      when "DEV"
        visit ENVIRONMENT['HOME']['DEV']['url'].gsub('{store_id}',@store_id.downcase)
      when "PRD"
        visit ENVIRONMENT['HOME']['PRD']['url'].gsub('{store_id}',@store_id.downcase)
    end
end

  Dado('debug') do
    binding.pry
  end
  
  
  