class Posts{
  int index;
  String title;
  String category;
  int price;

  Posts(this.index,this.title, this.category, this.price);

  String getTitle(){
    return this.title;
  }

  String getCategory(){
    return this.category;
  }

  String getPrice(){
    return "S/${this.price}";
  }

  int getIndex(){
    return this.index;
  }

  String toString(){
    return "${this.title}   ${this.category}   ${this.price}";
  }

  void editPost(String newTitle, String newCategory, int newPrice){
    this.title=newTitle;
    this.category=newCategory;
    this.price=newPrice;
  }

  void deletePost(){
    this.index=0;
    this.title= "";
    this.category="";
    this.price= 0;
  }
}