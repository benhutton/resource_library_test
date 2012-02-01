# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

module ResourceLibrary
  # Wipe everything out!
  Category.destroy_all
  Grouping.destroy_all
  GroupingType.destroy_all
  LibraryEntry.destroy_all
  Language.destroy_all

  # Create some grouping types and groupings
  topic = GroupingType.create(title: "Topic")
  unwasted_life = topic.groupings.create(title: "The Unwasted Life")
  joy = topic.groupings.create(title: "Joy")
  theology = topic.groupings.create(title: "Theology")
  scripture = topic.groupings.create(title: "Scripture")

  course = GroupingType.create(title: "Course")
  ap101 = course.groupings.create(title: "Apologetics 101")
  st101 = course.groupings.create(title: "Systematic Theology 101")

  author = GroupingType.create(title: "Author")
  piper = author.groupings.create(title: "John Piper")
  goligher = author.groupings.create(title: "Liam Goligher")
  carson = author.groupings.create(title: "Don Carson")

  GroupingType.create(title: "Language")
  GroupingType.create(title: "Date")
  
  # Create some categories
  sermons = Category.create(title: "Sermons", default_grouping_type_id: topic.id)
  articles = Category.create(title: "Articles", default_grouping_type_id: topic.id)
  seminary_training = Category.create(title: "Seminary Training", default_grouping_type_id: course.id)

  puts "#{Category.count} categories"
  puts "#{GroupingType.count} grouping types"
  puts "#{Grouping.count} groupings"

  # Create some sermons
  le = sermons.library_entries.create(title: "Desiring God", date: "2011-02-19")
  le.groupings << joy
  le.groupings << piper
  le.publish!

  le = sermons.library_entries.create(title: "Don't Waste Your Life", date: "2011-03-01")
  le.groupings << unwasted_life
  le.groupings << piper
  le.publish!

  le = sermons.library_entries.create(title: "I Will Go To God, My Exceeding Joy", date: "2010-04-29")
  le.groupings << joy
  le.groupings << piper
  le.publish!

  le = sermons.library_entries.create(title: "Finding Joy", date: "2012-01-19")
  le.groupings << joy
  le.groupings << goligher
  le.publish!

  le = sermons.library_entries.create(title: "The Authority Of Scripture", date: "2011-09-12")
  le.groupings << scripture
  le.groupings << goligher
  le.publish!

  # Create some articles
  le = articles.library_entries.create(title: "Why You Should Read The Bible", date: "2010-05-05")
  le.groupings << scripture
  le.groupings << piper
  le.publish!

  le = articles.library_entries.create(title: "Decision Making And The Will Of God", date: "2011-03-05")
  le.groupings << unwasted_life
  le.groupings << goligher
  le.publish!

  # Create some seminary classes
  le = seminary_training.library_entries.create(title: "Introduction to AP101", date: "2009-08-31")
  le.groupings << carson
  le.groupings << ap101
  le.groupings << theology
  le.publish!

  le = seminary_training.library_entries.create(title: "Why Worldview Matters", date: "2009-09-06")
  le.groupings << carson
  le.groupings << ap101
  le.groupings << unwasted_life
  le.publish!

  le = seminary_training.library_entries.create(title: "Introduction to ST101", date: "2008-08-31")
  le.groupings << piper
  le.groupings << st101
  le.groupings << theology
  le.publish!

  le = seminary_training.library_entries.create(title: "Why Scripture Matters", date: "2008-09-06")
  le.groupings << goligher
  le.groupings << st101
  le.groupings << scripture
  le.publish!
end
