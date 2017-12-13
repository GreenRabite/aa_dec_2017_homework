require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Andy") }
  let(:yogurt) { Dessert.new("yogurt", 500, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(yogurt.type).to eq("yogurt")
    end

    it "sets a quantity" do
      expect(yogurt.quantity).to eq(500)
    end

    it "starts ingredients as an empty array" do
      expect(yogurt.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{ Dessert.new("brownie","ice cream",chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      yogurt.add_ingredient("culture")
      expect(yogurt.ingredients).to include("culture")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["strawberry", "culture", "yeast", "banana"]

      ingredients.each do |ingredient|
        yogurt.add_ingredient(ingredient)
      end
      expect(yogurt.ingredients).to eq(ingredients)
      yogurt.mix!
      expect(yogurt.ingredients).not_to eq(ingredients)
      expect(yogurt.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      yogurt.eat(100)
      expect(yogurt.quantity).to eq(400)
    end
  end

    it "raises an error if the amount is greater than the quantity" do
      expect{yogurt.eat(501)}.to raise_error("not enough left!")
    end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Andy the Great Baker")
      expect(yogurt.serve).to eq("Chef Andy the Great Baker has made 500 yogurts!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(yogurt)
      yogurt.make_more
    end
  end
end
