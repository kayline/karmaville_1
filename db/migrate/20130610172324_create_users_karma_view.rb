class CreateUsersKarmaView < ActiveRecord::Migration
  def up
  	execute <<-SQL
	  	CREATE VIEW user_karma_counts AS
      SELECT user_id AS user_id, SUM(value) as karma_point_count
      FROM karma_points GROUP BY user_id;
    SQL
  end

  def down
  	execute <<-SQL
  	  DROP VIEW user_karma_counts;
  	SQL
  end
end
