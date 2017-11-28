def pet_shop_name(pet_shop)
    return (pet_shop)[:name]
end

def total_cash(pet_shop)
    return (pet_shop)[:admin][:total_cash]
end

def add_or_remove_cash(petshop, cash)
    #Method will work on both add and remove tests because
    #the integer to add in the remove test is (-10)
    petshop[:admin][:total_cash] += cash
end

def pets_sold(petshop)
    petshop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, sold)
    pet_shop[:admin][:pets_sold] += sold

    #     new_amount = pets_sold(petshop) + number_sold
end

def stock_count(petshop)
    #return the length of the pets array
    return petshop[:pets].length()
end

def pets_by_breed(petshop, name_of_breed)
    #count is going to count the elements of an array
    pets = []

    #loops through all the pets by breed and adds to array
    for pet in petshop[:pets]
        pets << pet if pet[:breed] == name_of_breed
    end
    return pets
end

def find_pet_by_name(petshop, name_of_pet)
    for pet in petshop[:pets]
        return pet if pet[:name] == name_of_pet
    end
    return nil
end

def remove_pet_by_name(pet_shop, name_of_pet)

    #locate the entry of name of pet, then remove entry
    pet_shop[:pets].delete(find_pet_by_name(pet_shop, name_of_pet))
end

def add_pet_to_stock(petshop, new_pet)
    #method adds item from new pet hash and adds it to pet shop
    #test then counts total stock to see if it is +1

    #push the hash from newpets and add it to pets array
    petshop[:pets] << new_pet
end

def customer_pet_count(customers)
    #method takes the length of the customers pet array
    return customers[:pets].length
end

def add_pet_to_customer(customers, new_pet)
    #adds the hash within new_pets array to the pets array of the customers
    return customers[:pets] << new_pet
end

def customer_can_afford_pet(customers, new_pet)
    #expects that the second customer in the array cannot afford the pet

    #this method needs to compare the price of new_pet with the cash of the
    #customer and then return false

    return customers[:cash] >= new_pet[:price]
end

def sell_pet_to_customer(petshop, pet, customer)
    #method sells a pet to the customer

    #assess first whether pet exists for sale and if
    #customer can afford to buy then proceed with sale

    if pet != nil
        if customer_can_afford_pet(customer, pet)
    #increase pets sold by 1
        increase_pets_sold(petshop, 1)

    # #add the price to the pet shop
        add_or_remove_cash(petshop, pet[:price])

    #needs to add pet to the customers array
        add_pet_to_customer(customer, pet)
        end
    end
end
