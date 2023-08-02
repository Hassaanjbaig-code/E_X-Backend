<div align="center">
  <h2><b>🕹️🕹️ E X API 🕹️🕹️</b></h2>
  <br/>
  <img src="./public/logo.png" alt="logo" width="140"  height="auto" />
  <br/>
</div>

<a name="readme-top"></a>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Usage](#usage)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 [E_X-api] <a name="about-project"></a>

**[E X APi]** is the backend application for the ECommerce website where the user can add the products update and delete a products. If the user like the product he/she can add to cart it show much qunatity they need. The user login and log out by the Token base Authentication.


### Tech Stack <a name="tech-stack"></a>

- <a href="https://www.ruby-lang.org/en/documentation/">Ruby</a>
- <a href="https://rubyonrails.org/">Rails</a>
- <a href="https://www.postgresql.org/">PostgreSQL</a>

<!-- Features -->

### Key Features <a name="key-features"></a>

- **[User Registration and Authentication]**
- **[When the user adds a product to the cart with a certain quantity, the quantity of the product also decreases.]**
- **[Add Active Storage to store the image of the product.]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🚀 Resources <a name="api-docs"></a>

There are 4 main resources need in ECommerence prototypes:

   - Products http://127.0.0.1:3001/api/v1/products
   - Carts http://127.0.0.1:3001/api/v1/carts
   - Users http://127.0.0.1:3001/api/v1/users
   - Login Token http://127.0.0.1:3001/api/v1/login


<p align="right">(<a href="#readme-top">back to top</a>)</p>
    
    
    ## How to

you can fetch data with any kind of methods you know(fetch API, Axios, jquery ajax,...)

### Get all products

```js
fetch("http://127.0.0.1:3001/api/v1/products")
  .then((res) => res.json())
  .then((json) => console.log(json));
```

### Get a single product

```js
fetch("http://127.0.0.1:3001/api/v1/products/1")
  .then((res) => res.json())
  .then((json) => console.log(json));
```

### Add new product

```js
fetch("http://127.0.0.1:3001/api/v1/products", {
  method: "POST",
  body: JSON.stringify({
    title: "test product",
    price: 13.5,
    description: "test Description",
    image: "Add a File",
    category: "electronic",
  }),
})
  .then((res) => res.json())
  .then((json) => console.log(json));

/* will return
{
 id:31,
 title:'...',
 price:'...',
 category:'...',
 description:'...',
 image:'...'
 quantity: '....'
}
*/
```

Note: Posted data will not really insert into the database and just return a fake id.

### Updating a product

```js
fetch("http://127.0.0.1:3001/api/v1/products/7", {
  method: "PUT",
  body: JSON.stringify({
    title: "test product",
    price: 13.5,
    description: "lorem ipsum set",
    image: "https://i.pravatar.cc",
    category: "electronic",
    quantity: '12'
  }),
})
  .then((res) => res.json())
  .then((json) => console.log(json));

/* will return
{
    id:7,
    title: 'test product',
    price: 13.5,
    description: 'lorem ipsum set',
    image: 'https://i.pravatar.cc',
    category: 'electronic'
    quantity: '12'
}
*/
```

```js


Note: Edited data will not really be updated into the database.

### Deleting a product

```js
fetch("http://127.0.0.1:3001/api/v1/products/8", {
  method: "DELETE",
});
```

Nothing will delete on the database.


## All available routes

### Products

```js
fields:
{
    id:Number,
    title:String,
    price:Number,
    category:String,
    description:String,
    image:file
    quantity: String
}

GET:

- /products (get all products)
- /products/1 (get specific product based on id)
- /products (Creating a Product)
- /products/1 (Deleting a Products)
- /products/1 (Updating a Products)


## Carts

```js
fetch("http://127.0.0.1:3001/api/v1/carts", {
  method: "PUT",
  body: JSON.stringify({
    total_price: 56
    quantity: '12'
  }),
})
  .then((res) => res.json())
  .then((json) => console.log(json));

/* will return
{
    id:1,
    total_price: 56
    quantity: '12'
    created_at: date
    update_at: date
}
*/
```

GET:

- /carts 
- /carts/1 

// Cart display only the user cart which user selected

POST:

- /carts

PATCH:

- /carts/1

DELETE:

- /carts/1



## Users

### Creating a user

    ```js
fetch("http://127.0.0.1:3001/api/v1/user", {
  method: "POST",
  body: JSON.stringify({
    name: 'test',
    email: 'test@example.com',
    passoword: 'Test1122'
  }),
})
  .then((res) => res.json())
  .then((json) => console.log(json));

/* will return
{
    id:1,
    name: 'test',
    email: 'test@example.com',
    passoword: 'Test1122'
}
*/
```

### See the current user

    /me


### Auth

```js
fields:
{
    email:String,
    password:String
}
```

POST:

- /login


    
<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

1. git
use the following link to setup `git` if you dont have it already installed on your computer
<p align="left">(<a href="https://git-scm.com/book/en/v2/Getting-Started-Installing-Git">install git</a>)</p>

2. Ruby
use the following link to setup `Ruby` if you dont have it already installed on your computer
<p align="left">(<a href="https://www.ruby-lang.org/en/documentation/installation/">install Ruby</a>)</p>

3. Rails
use the following link to setup `Rails` if you dont have it already installed on your computer
<p align="left">(<a href="https://guides.rubyonrails.org/getting_started.html#creating-a-new-rails-project-installing-rails">install Ruby</a>)</p>

4. PostgreSQL
use the following link to setup `PostgreSQL` if you dont have it already installed on your computer
<p align="left">(<a href="https://www.tutorialspoint.com/postgresql/postgresql_environment.htm">install PostgreSQL</a>)</p>

### Setup

Clone this repository to your desired folder:

```sh
  git clone https://github.com/Hassaanjbaig-code/E_X-Backend.git
```

Install dependencies:

```sh
  cd E_X-Backend
  bundle install
```

### Database
Edit `config/database.yml` with your database connection info. Run the foolowing command

```sh
    rails db:create
    rails db:schema:load
```

### Usage

The following command can be used to run the application.

```sh
  rails s
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Hassaan Baig**
- GitHub: [@Hassaan Baig](https://github.com/Hassaanjbaig-code/)
- LinkedIn: [Hassaan Baig](https://linkedin.com/in/hassaan-jawwad=baig)


## 🔭 Future Features <a name="future-features"></a>

- [ ] **[Add Admin dashboard]**
- [ ] **[Add payment system]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project, please don't forget to follow the contributors and give it a star.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
