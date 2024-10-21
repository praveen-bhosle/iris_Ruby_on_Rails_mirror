# Create a New Rails Project

Follow the steps below to create a new Rails project:

### 1. Check Ruby and Rails Installation
   ```
   ruby --version
   rails --version
   ```
   > You should see the versions of Ruby and Rails installed. If not installed then follow [this](../setup/README.md) to install them.

### 2. Navigate to the Bootcamp Repository
Make sure you are inside the bootcamp repository that you have cloned. The repository should be named `ror-bootcamp-2024-<your_github_username>`.
 
### 3. Create a New Rails Project
Run the following command to create a new Rails project named iris-ror-bootcamp
   ```
   rails new iris-ror-bootcamp
   ```
![image](https://github.com/user-attachments/assets/6284a0be-5004-4f51-a6a8-c30360e87ea4)

You should see the folder structure being created. It will look similar to the following:

![image](https://github.com/user-attachments/assets/0ba57a61-4ba3-435e-a05b-bcf981aa206f)

> **NOTE**: Do not create the Rails project inside the `week_2` folder as you will use this project throughout the bootcamp.

### 4.Navigate into the Project Directory
```
cd iris-ror-bootcamp
```

### 5. Install Required Gems
```
bundle install
```

### 6. Create the Default Database
Rails uses **SQLite** as the default database, which is lightweight and ideal for development. We'll use SQLite for this bootcamp.

```
rails db:create
```

### 7. Start the Rails Server

Finally, run the following command to start the Rails server:

```
rails server
```

The server should now be running on `localhost:3000`. When you navigate to `http://localhost:3000` in your browser, you should see the default Rails welcome page, similar to the image below
![image](https://github.com/user-attachments/assets/55e836da-b58e-45f6-88d2-135826c7d104)



