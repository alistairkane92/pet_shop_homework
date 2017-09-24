def pet_shop_name(pet_shop)
    return (pet_shop)[:name]
end

def total_cash(pet_shop)
    return (pet_shop)[:admin][:total_cash]
end

def add_or_remove_cash(petshop_array, cash)
    #Method will work on both add and remove tests because
    #the integer to add in the remove test is (-10)
    petshop_array[:admin][:total_cash] = petshop_array[:admin][:total_cash] + cash
    return petshop_array[:admin][:total_cash]
end

def add_or_remove_cash__add(petshop_array, cash)
    add_or_remove_cash(petshop_array, cash)
end

def add_or_remove_cash__remove(petshop_array, cash)
    add_or_remove_cash(petshop_array, cash)
end

def pets_sold(petshop_array)
    return petshop_array[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop_array, sold)
    pet_shop_array[:admin][:pets_sold] = pet_shop_array[:admin][:pets_sold] + sold
    return pet_shop_array[:admin][:pets_sold]

    #     new_amount = pets_sold(petshop_array) + number_sold
end

def stock_count(petshop_array)
    #return the length of the pets array
    return petshop_array[:pets].length()
end


def pets_by_breed(petshop_array, name_of_breed)
    #count is going to count the elements of an array
    new_array = []
    second_array = []

    #loops through all the pets by breed and adds to array
    for item in petshop_array[:pets]
        new_array.push(item[:breed])
    end

    for item in new_array
        if item.include?(name_of_breed)
            second_array.push(item)
        end
    end
    return second_array
end

def all_pets_by_breed_found(petshop_array, breed)
    pets_by_breed(petshop_array, breed)
end

def all_pets_by_breed_not_found(petshop_array, breed)
    pets_by_breed(petshop_array, breed)
end

def find_pet_by_name(petshop_array, name_of_pet)
    for item in petshop_array[:pets]
        if item[:name] == name_of_pet
            return item
        end
    end
    return nil
end

def find_pet_by_name_returns_pet(petshop_array, name_of_pet)
    find_pet_by_name(petshop_array, name_of_pet)
end

def find_pet_by_name_returns_nil(petshop_array, name_of_pet)
    find_pet_by_name(petshop_array, name_of_pet)
end

def remove_pet_by_name(petshop_array, name_of_pet)
    new_array = []
    #locate the entry of name of pet, then remove entry
    for item in petshop_array[:pets]
        if item[:name] == name_of_pet
        petshop_array[:pets].delete(item)
        end
    end
end

def add_pet_to_stock(petshop_array, new_pet)
    #method adds item from new pet hash and adds it to pet shop
    #test then counts total stock to see if it is +1

    #push the hash from newpets and add it to pets array
    return petshop_array[:pets] << new_pet
end

def customer_pet_count(customers_array)
    #method takes the length of the customers pet array
    return customers_array[:pets].length
end

def add_pet_to_customer(customers_array, new_pet)
    #adds the hash within new_pets array to the pets array of the customers_array
    return customers_array[:pets] << new_pet
end

def customer_can_afford_pet(customers_array, new_pet)
    #expects that the second customer in the array cannot afford the pet

    #this method needs to compare the price of new_pet with the cash of the
    #customer and then return false

    if customers_array[:cash] < new_pet[:price]
        return false
    else
        return true
    end
end

def price_of_pet(pet_name)
    return pet_name[:price]
end

# def customer_cash(customer)
#     return customer[:cash]
# end

def sell_pet_to_customer(petshop_array, pet, customer)
    #method sells a pet to the customer

    #assess first whether pet exists for sale and if
    #customer can afford to buy then proceed with sale


    #increase pets sold by 1
        increase_pets_sold(petshop_array, 1)

    # #add the price to the pet shop
        add_or_remove_cash__add(petshop_array, price_of_pet(pet))

    #needs to add pet to the customers array
        add_pet_to_customer(customer, pet)

end


def sell_pet_to_customer_pet_found(petshop_array, pet, customer)
    sell_pet_to_customer(petshop_array, pet, customer)
end

def sell_pet_to_customer_pet_not_found(petshop_array, pet, customer)
    if find_pet_by_name_returns_pet(petshop_array, pet)
        sell_pet_to_customer(petshop_array, pet, customer)
    end
end

def test_sell_pet_to_customer__insufficient_funds(petshop_array, pet, customer)
    if find_pet_by_name_returns_pet(petshop_array, pet) && customer_can_afford_pet(customer, pet)
        sell_pet_to_customer(petshop_array, pet, customer)
    end
end
