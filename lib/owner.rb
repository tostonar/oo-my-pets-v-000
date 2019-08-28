class Owner
  attr_reader :species
  attr_accessor :name, :pets
  @@owners = []

  def initialize(species)
    @species = species
    @@owners.push(self)
    @pets = {fishes: [], dogs: [], cats: []}
  end

  def say_species
    "I am a #{@species}."
  end

  def pets
    @pets
  end

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes].push(fish)
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats].push(cat)
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs].push(dog)
  end

  def walk_dogs
    @pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets
    @pets.each do|type, animals|
       animals.each do |animal|
         animal.mood = "nervous"
        end
        animals.clear 
      end
    @pets
  end

  def list_pets
    
    "I have #{@pets[:fishes].size} fish, #{@pets[:dogs].size} dog(s), and #{@pets[:cats].size} cat(s)."
  end

  def self.all
    @@owners
  end

  def self.count
    @@owners.length
  end

  def self.reset_all
    @@owners.clear
  end
end