class Human

  attr_accessor :name, :age, :id

  def underage?
    age < 18
  end

  def say_hello
    print "Hello there! I am #{@name} and I am #{@age} years old\n"
  end

  def save
    if id == nil
      raise "You cant save without id"
    end

    if !exist?
      File.open("humans.txt", 'a') do |file| 
        file.write("#{id}, #{name}, #{age}\n") 
      end
    end
  end

  def exist?
    exists = false

    file = File.new("humans.txt", "r")

    while (line = file.gets)
      data = line.split(",")
      existing_id = data[0]

      if existing_id.to_i == id
        exists = true
      end
    end
    file.close

    exists
  end

end