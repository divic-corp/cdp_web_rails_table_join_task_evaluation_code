class ExercisesController < ApplicationController
  def exercise1
    @foods = Food
  end

  def exercise2
    @shops = Shop
  end

  def exercise3
    @address = Address
  end

  def exercise4
    @customer = Customer
  end
end
