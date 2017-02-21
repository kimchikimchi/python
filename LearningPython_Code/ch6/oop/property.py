from pprint import pprint

class Person:
    def __init__(self, age):
        self.age = age  # anyone can modify this freely

class PersonWithAccessors:
    def __init__(self, age):
        self.__age = age

    def get_age(self):
        return self.__age

    def set_age(self):
        if 18 <= age <= 99:
            self.__age = age
        else:
            raise ValueError('Age must be within [18, 99]')

class PersonPythonic:
    def __init__(self, age):
        self.__age = age

    @property
    def age(self):
        return self.__age

    @age.setter
    def age(self, age):
        if 18 <= age <= 99:
            self.__age = age
        else:
            raise ValueError('Age must be within [18, 99]')

person = PersonPythonic(39)
print(person.age)  # 39 - Notice we access as data attribute
person.age = 42  # Notice we access as data attribute
print(person.age)  # 42
#person.age = 100  # ValueError: Age must be within [18, 99]

person_access = PersonWithAccessors(12)
print(person_access.get_age())

# Show each class has its own namespace mangled attributes
pprint(person.__dict__)
pprint(person_access.__dict__)
