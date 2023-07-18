# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#triangular_flag_on_post-deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ](#faq)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 About the Project <a name="about-project"></a>

**Vet Clinic** In this project, I've used a relational database to create the initial data structure for a vet clinic. I've created a table to store animals' information, inserted some data into it, and queried it.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

- **Adding a few more tables**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LIVE DEMO -->

## 🚀 Live Demo <a name="live-demo"></a>

- [Live Demo Link]()

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

- [PostgreSQL](https://www.postgresql.org/) server installed and running.
- [psql](https://www.postgresql.org/docs/current/app-psql.html) installed.

### Setup

Clone this repository to your desired folder:

```sh
  git clone git@github.com:myaccount/vet_clinic.git
  cd vet_clinic
```

### Create a database

To create a database follow the steps mentioned below:

1. Connect to your PostgreSQL server with `psql`:

```sh
 > psql\
 postgres=#
```

2. Create the database `vet_clinic`:

```sh
 postgres=# CREATE DATABASE vet_clinic;
 CREATE DATABASE
```

3.  Connect to the database that you've just created:

```sh
 postgres=# \c vet_clininc
 You are now connected to database "vet_clinic" as user "postgres".
 vet_clinic=#
```

That's it! Congratulations, you have created your database and connected to it. Next, we will add a table. Learn more at [PostgreSQL: Create a database](https://www.postgresql.org/docs/current/sql-createdatabase.html)

- Use [schema.sql](https://github.com/iamsjunaid/vet_clinic/blob/dev/schema.sql) to create all tables.
- Use [data.sql](https://github.com/iamsjunaid/vet_clinic/blob/dev/data.sql) to populate tables with sample data.
- Check [queries.sql](https://github.com/iamsjunaid/vet_clinic/blob/dev/queries.sql) for examples of queries that can be run on a newly created database.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Author1**

- GitHub: [@Github](https://github.com/iamsjunaid)
- LinkedIn: [LinkedIn](https://linkedin.com/in/junaidahmedsyed)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- **Add more tables**
- **Add queries**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/iamsjunaid/vet_clinic/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project please give it a 🌟.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank [Microverse](https://www.microverse.org/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](https://github.com/iamsjunaid/vet_clinic/blob/bf9f8b06088712b4c6a9735414958a2efed288d1/LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
