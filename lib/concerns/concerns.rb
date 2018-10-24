module Concerns

  module Findable

    def find_by_name(name)
      self.all.select{|class_instance| class_instance.name == name}[0]
    end

    def find_or_create_by_name(name)
      found = self.all.select{|class_instance| class_instance.name == name}
      if found.nil?
        self.create(name)
      end
    end

  end
end
