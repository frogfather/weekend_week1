def pet_shop_name(pet_shop)
return pet_shop[:name]
end

def total_cash(pet_shop)
return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop,pets)
pet_shop[:admin][:pets_sold] += pets
end

def stock_count(pet_shop)
return pet_shop[:pets].count#
end

def pets_by_breed(pet_shop, breed)
breed_list=[]
  for pet in pet_shop[:pets] 
    if pet[:breed] == breed then breed_list.push(pet[:name])
    end
  end
return breed_list
end

def find_pet_by_name(pet_shop,name)
  for pet in pet_shop[:pets]
    if pet[:name] == name 
      return pet
    end
  end 
return nil  
end

def remove_pet_by_name(pet_shop, name)
to_remove = -1
  for pet in pet_shop[:pets]
    if pet[:name] == name 
      to_remove = pet_shop[:pets].index(pet)
    end
  end
  if to_remove > -1 
  pet_shop[:pets].delete_at(to_remove)  
  end
end

def add_pet_to_stock(pet_shop, new_pet)
pet_shop[:pets].push(new_pet)
end

def customer_pet_count(customer)
return customer[:pets].count
end

def add_pet_to_customer(customer, pet)
customer[:pets].push(pet)
end

#optional

def customer_can_afford_pet(customer,pet)
# this returns false if the pet doesn't exist
# which isn't strictly correct, but ensures you
# can't sell an non-existent pet!
  if pet == nil 
    return false else
    if customer[:cash] < pet[:price]
      return false else return true
    end
  end    
end

def sell_pet_to_customer(pet_shop, pet, customer)
# we'll check first if the customer can afford the pet
if customer_can_afford_pet(customer, pet)

  #reasonable to transfer money before handing over goods!
  cost_of_pet = pet[:price]
  add_or_remove_cash(pet_shop,cost_of_pet)
  customer[:cash] -= cost_of_pet

  #now hand over the pet
  pet_name = pet[:name]
  remove_pet_by_name(pet_shop, pet_name)
  add_pet_to_customer(customer,pet)

  #finally we increase the number of pets sold
  increase_pets_sold(pet_shop,1)
end
end



