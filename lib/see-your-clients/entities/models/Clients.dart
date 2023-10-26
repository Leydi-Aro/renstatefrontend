

class Clients{
  int index;
  String name;
  int age;

  Clients(this.index,this.name, this.age);

  String getName(){
    return this.name;
  }

  String getAge(){
    return "${this.age} years old";
  }

  int getIndex(){
    return this.index;
  }

  String toString(){
    return "${this.name}   ${this.age}";
  }

  void editClient(String newName, int newAge){
    this.name=newName;
    this.age=newAge;
  }

  void deleteClient(){
    this.index=0;
    this.name= "";
    this.age= 0;
  }
}