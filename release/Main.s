##
  class test
##
Human
  public age
  constr(age)
    this.age = age
  destr
    println("Deleted")
  public getAge()
    ret age
main
  h = new Human(32)
  prinln("Human age: "+h.getAge())
  # next ret 0 and print "Deleted"