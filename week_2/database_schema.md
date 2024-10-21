# Database Schema for Forms Application

![image](https://github.com/user-attachments/assets/003e0342-0786-4055-ab92-13893ef22a5d)

This schema defines the structure for a basic form-building application. Below is the breakdown of each table and its relationships:

### Table: `Form`
The `Form` table stores information about each form created in the application. This is the core table where forms are defined.

- **Columns**:
  - `id`: A unique identifier for each form. This is the primary key.
  - `name`: The name of the form (e.g., "Registration Form").
  - `description`: A detailed description of the form.
  - `created_at`: The timestamp when the form was created.

### Table: `FormField`
The `FormField` table stores the individual fields that belong to a form. Each form can have multiple fields like text inputs, checkboxes, etc.

- **Columns**:
  - `id`: A unique identifier for each form field. This is the primary key.
  - `form_id`: The ID of the form this field belongs to (foreign key referencing the `Form` table).
  - `field_text`: The label or prompt for the field (e.g., "Name", "Email").
  - `type`: The type of the field (e.g., text, checkbox, radio button, etc.).
  - `created_at`: The timestamp when the field was created.

- **Relationship**:
  - Each field belongs to one form (many fields to one form).
  - `form_id` is a foreign key that links to the `id` column in the `Form` table.

### Table: `Response`
The `Response` table stores the responses submitted for each form. Each form can have multiple responses.

- **Columns**:
  - `id`: A unique identifier for each response. This is the primary key.
  - `form_id`: The ID of the form that this response belongs to (foreign key referencing the `Form` table).
  - `created_at`: The timestamp when the response was submitted.

- **Relationship**:
  - Each response is tied to one form.
  - `form_id` is a foreign key that links to the `id` column in the `Form` table.

### Table: `Answer`
The `Answer` table stores the actual answers to individual fields within a form submission. Each response can have multiple answers (one for each field in the form).

- **Columns**:
  - `id`: A unique identifier for each answer. This is the primary key.
  - `response_id`: The ID of the response this answer is associated with (foreign key referencing the `Response` table).
  - `field_id`: The ID of the field that this answer corresponds to (foreign key referencing the `FormField` table).
  - `response_text`: The actual answer submitted for the field.
  
- **Relationships**:
  - Each answer belongs to one response.
  - Each answer is linked to one field from the form.
  - `response_id` is a foreign key linking to the `id` column in the `Response` table.
  - `field_id` is a foreign key linking to the `id` column in the `FormField` table.

---

### Relationships Summary

- **Form to FormField**: A form can have many fields, but each field belongs to one form. This is a **many-to-one** relationship. 
  - `form_id` in the `FormField` table references the `id` in the `Form` table.

- **Form to Response**: A form can have many responses, but each response belongs to one form. 
  - `form_id` in the `Response` table references the `id` in the `Form` table.

- **Response to Answer**: Each response can have many answers, but each answer belongs to one response.
  - `response_id` in the `Answer` table references the `id` in the `Response` table.

- **FormField to Answer**: Each answer corresponds to one field, but each field can be answered many times.
  - `field_id` in the `Answer` table references the `id` in the `FormField` table.

---

This schema allows for the creation of dynamic forms, the ability to collect multiple responses for each form, and the storage of answers to individual form fields within those responses.

**NOTE**: We will be making changes to this schema in the future weeks.
