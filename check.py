import tkinter as tk
from tkinter import ttk, messagebox
import mysql.connector

# Connect to the MySQL database
db = mysql.connector.connect(
    host="which host u r using add here",
    user="add your username here",
    password="add your password here",
    database="payroll is the database that i used for the sql"
)

# Create the main window
root = tk.Tk()
root.title("Payroll Management System")
root.geometry("1200x800")
root.configure(bg="#F0F0F0")  # Set background color

# Create a notebook (tabbed interface)
notebook = ttk.Notebook(root)
notebook.pack(fill="both", expand=True)

# Employee tab
employee_tab = ttk.Frame(notebook)
notebook.add(employee_tab, text="Employees")

# Create a treeview for displaying employee data
employee_tree = ttk.Treeview(employee_tab, columns=("id", "first_name", "last_name", "email", "phone", "hire_date", "job_title", "department", "salary"), show="headings")
employee_tree.heading("id", text="ID")
employee_tree.heading("first_name", text="First Name")
employee_tree.heading("last_name", text="Last Name")
employee_tree.heading("email", text="Email")
employee_tree.heading("phone", text="Phone")
employee_tree.heading("hire_date", text="Hire Date")
employee_tree.heading("job_title", text="Job Title")
employee_tree.heading("department", text="Department")
employee_tree.heading("salary", text="Salary")
employee_tree.pack(side="left", fill="both", expand=True)

# Load employee data from the database
cursor = db.cursor()
cursor.execute("SELECT e.employee_id, e.first_name, e.last_name, e.email, e.phone, e.hire_date, e.job_title, d.department_name, e.salary FROM employees e JOIN departments d ON e.department_id = d.department_id")
for row in cursor:
    employee_tree.insert("", "end", values=row)
cursor.close()

# Function to edit employee record
def edit_employee():
    selected_item = employee_tree.focus()
    values = employee_tree.item(selected_item)["values"]

    edit_window = tk.Toplevel(root)
    edit_window.title("Edit Employee")

    # Create entry fields for each column
    entries = []
    for i, value in enumerate(values):
        row = tk.Frame(edit_window)
        row.pack(side=tk.TOP, padx=5, pady=5)
        label = tk.Label(row, width=15, text=employee_tree.heading(i + 1)["text"], anchor="w")
        entry = tk.Entry(row)
        entry.insert(0, value)
        label.pack(side=tk.LEFT)
        entry.pack(side=tk.LEFT)
        entries.append(entry)

    # Function to save edited employee record
    def save_edited_employee():
        employee_id = values[0]
        new_values = [entry.get() for entry in entries]
        cursor = db.cursor()
        query = "UPDATE employees SET first_name=%s, last_name=%s, email=%s, phone=%s, hire_date=%s, job_title=%s, department_id=(SELECT department_id FROM departments WHERE department_name=%s), salary=%s WHERE employee_id=%s"
        cursor.execute(query, new_values + [employee_id])
        db.commit()
        cursor.close()
        edit_window.destroy()
        employee_tree.item(selected_item, values=new_values)

    save_button = tk.Button(edit_window, text="Save", command=save_edited_employee, bg="#4CAF50", fg="white")
    save_button.pack(pady=10)

# Function to add a new employee record
def add_employee():
    add_window = tk.Toplevel(root)
    add_window.title("Add Employee")

    # Create entry fields for each column
    entries = []
    for i, heading in enumerate(employee_tree["columns"]):
        row = tk.Frame(add_window)
        row.pack(side=tk.TOP, padx=5, pady=5)
        label = tk.Label(row, width=15, text=employee_tree.heading(i + 1)["text"], anchor="w")
        entry = tk.Entry(row)
        label.pack(side=tk.LEFT)
        entry.pack(side=tk.LEFT)
        entries.append(entry)

    # Function to save new employee record
    def save_new_employee():
        new_values = [entry.get() for entry in entries]
        cursor = db.cursor()
        query = "INSERT INTO employees (first_name, last_name, email, phone, hire_date, job_title, department_id, salary) VALUES (%s, %s, %s, %s, %s, %s, (SELECT department_id FROM departments WHERE department_name=%s), %s)"
        cursor.execute(query, new_values[1:])
        db.commit()
        employee_id = cursor.lastrowid
        cursor.close()
        employee_tree.insert("", "end", values=(employee_id,) + tuple(new_values[:1] + new_values[2:]))
        add_window.destroy()

    save_button = tk.Button(add_window, text="Save", command=save_new_employee, bg="#4CAF50", fg="white")
    save_button.pack(pady=10)

# Add buttons for editing and adding employees
button_frame = tk.Frame(employee_tab, bg="#F0F0F0")
button_frame.pack(side=tk.TOP, pady=10)
edit_button = tk.Button(button_frame, text="Edit Employee", command=edit_employee, bg="#2196F3", fg="white")
edit_button.pack(side=tk.LEFT, padx=5)
add_button = tk.Button(button_frame, text="Add Employee", command=add_employee, bg="#4CAF50", fg="white")
add_button.pack(side=tk.LEFT, padx=5)

# Payroll Records tab (same as before)
payroll_tab = ttk.Frame(notebook)
notebook.add(payroll_tab, text="Payroll Records")

payroll_tree = ttk.Treeview(payroll_tab, columns=("id", "employee", "start_date", "end_date", "hours_worked", "gross_pay", "taxes", "deductions", "net_pay"), show="headings")
payroll_tree.heading("id", text="ID")
payroll_tree.heading("employee", text="Employee")
payroll_tree.heading("start_date", text="Pay Period Start")
payroll_tree.heading("end_date", text="Pay Period End")
payroll_tree.heading("hours_worked", text="Hours Worked")
payroll_tree.heading("gross_pay", text="Gross Pay")
payroll_tree.heading("taxes", text="Taxes")
payroll_tree.heading("deductions", text="Deductions")
payroll_tree.heading("net_pay", text="Net Pay")
payroll_tree.pack(side="left", fill="both", expand=True)

cursor = db.cursor()
cursor.execute("SELECT pr.record_id, CONCAT(e.first_name, ' ', e.last_name), pr.pay_period_start, pr.pay_period_end, pr.hours_worked, pr.gross_pay, pr.taxes, pr.deductions, pr.net_pay FROM payroll_records pr JOIN employees e ON pr.employee_id = e.employee_id")
for row in cursor:
    payroll_tree.insert("", "end", values=row)
cursor.close()

# Start the main event loop
root.mainloop()

# Close the database connection
db.close()
