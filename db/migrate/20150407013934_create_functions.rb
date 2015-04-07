class CreateFunctions < ActiveRecord::Migration
  def up
    drop_function('info_returned_as_table(customers.customer_id%TYPE)')
    drop_function('info_returned_as_type(customers.customer_id%TYPE)')
    drop_function('info_returned_as_record(customers.customer_id%TYPE)')
    drop_function('userdefinedtype(text)')
    execute('DROP TYPE IF EXISTS customer_info')

    execute_function_file('foo_returns_table')
    execute_function_file('foo_returns_type')
    execute_function_file('foo_returns_record')
    execute_function_file('user_defined_type')
  end

  def down
    drop_function('info_returned_as_table(customers.customer_id%TYPE)')
    drop_function('info_returned_as_type(customers.customer_id%TYPE)')
    drop_function('info_returned_as_record(customers.customer_id%TYPE)')
    drop_function('userdefinedtype(text)')
    execute('DROP TYPE IF EXISTS customer_info')
  end
end
