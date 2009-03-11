class CreateExampleData < ActiveRecord::Migration
  def self.up
    # Create 250 Posts with 0-49 comments each
    comments = 0
    250.times do |i|
      post = Post.create :author => AUTHORS.rand,
        :title => TITLES.rand,
        :body => (0..(rand(20) + 10)).map { LOREM_IPSUM.rand }.join
      rand(50).times do
        post.comments.create :author => AUTHORS.rand,
          :body => (0..(rand(5) + 1)).map { LOREM_IPSUM.rand }.join
      end
      comments += post.comments.size
      puts "Created #{i+1} posts and #{comments} comments" if (i+1) % 50 == 0
    end
  end

  def self.down
    Comment.delete_all
    Post.delete_all
  end

  # Yeah, we _could_ use the faker gem - but it doesn't come with any sesame street characters!
  AUTHORS = "Kermit the Frog, Ernie, Bert, Aloysius Snuffleupagus, Oscar the Grouch, Slimey, Fluffy, Papa Bear, Mama Bear, Curly Bear, Baby Bear, Telly, Zoe, Rosita, Elmo, Mr. Johnson, Grover, Cookie Monster, Prairie Dawn".split(', ')
  TITLES = [
    "The Muppet Movie (1979)",
    "The Great Muppet Caper (1981)",
    "The Muppets Take Manhattan (1984)",
    "The Muppet Christmas Carol (1992)",
    "Muppet Treasure Island (1996)",
    "Muppets from Space (1999)",
    "It's A Very Merry Muppet Christmas Movie (2002)",
    "The Muppets' Wizard of Oz (2005)",
    "Sam and Friends (1955-61)",
    "Sesame Street (1969-present)",
    "The Muppet Show (1976-1981)",
    "Fraggle Rock (1983-87)",
    "Muppet Babies (1984-1991)",
    "The Jim Henson Hour (1989)",
    "Secret Life of Toys (1994-1996)",
    "Muppets Tonight (1996-1998)",
    "Hey Cinderella! (1970)",
    "The Frog Prince (1971)",
    "The Muppet Musicians of Bremen (1972)",
    "The Muppets Valentine Show (1974)",
    "Emmet Otter's Jug-Band Christmas (1977)",
    "The Muppets Go Hollywood (1979)",
    "John Denver and the Muppets: A Christmas Together (1979)",
    "The Muppets Go To the Movies (1981)",
    "Of Muppets and Men (1981)",
    "The Fantastic Miss Piggy Show (1982)",
    "Rocky Mountain Holiday with John Denver and the Muppets (1983)",
    "The Muppets: A Celebration of 30 Years (1985)",
    "The Christmas Toy (1986)",
    "The Tale of the Bunny Picnic (1986)",
    "A Muppet Family Christmas (1987)",
    "Song of the Cloud Forest (1989)",
    "The Muppets at Walt Disney World (1990)",
    "The Muppets Celebrate Jim Henson (1990)",
    "Mr. Willowby's Christmas Tree (1995)",
    "Studio DC hosted by Dylan and Cole Sprouse (2008)",
    "Studio DC hosted by Selena Gomez (2008)",
    "A Muppet Christmas: Letters to Santa (2008)",
    "Muppet Classic Theater (1994)",
    "Elmo Saves Christmas (1996)",
    "Kermit's Swamp Years (2002)",
    "Abby in Wonderland (2008)",
    "Love and stoplights can be cruel.",
    "no matter how old you are, deep down, your still 3",
    "i cant spell snuffys full name!",
    "looks like a job for, SUPPER GROVER!",
    "c is for cookie... and for cardcaptor sakura",
    "one day, elmo will marry zoey",
    "jayde thinks that if jayde talks in the third person, jayde will be like elmo",
    "im on my way to sessame street",
    "Me not *take* cookies, me *eat* the cookies.",
    "... so the bear says, You didn't really come here to hunt, did you?",
    "I'm going to find Big Bird, wherever he is, and bring him back to the Dodos!",
    "Okay, here's one. Why did the chicken *not* cross the road? Because it's chicken! Get it?",
    "Never refer to me as an item. I'm a bird.",
  ]
  LOREM_IPSUM = [
    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  sed diam nonumy eirmod ",
    "tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.\n At vero ",
    "eos et accusam et justo duo dolores et ea rebum.\n Stet clita kasd gubergren, no sea ",
    "takimata sanctus est Lorem ipsum dolor sit amet.\n Lorem ipsum dolor sit amet, consetetur ",
    "sadipscing elitr,  sed diam nonumy eirmod tempor invidunt ut labore et dolore magna ",
    "aliquyam erat, sed diam voluptua.\n At vero eos et accusam et justo duo dolores et ea ",
    "rebum.\n Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\n ",
    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  sed diam nonumy eirmod tempor ",
    "invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.\n At vero eos et accusam ",
    "et justo duo dolores et ea rebum.\n Stet clita kasd gubergren, no sea takimata sanctus est ",
    "Lorem ipsum dolor sit amet.\n Duis autem vel eum iriure dolor in hendrerit in ",
    "vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at ",
    "vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit ",
    "augue duis dolore te feugait nulla facilisi.\n Lorem ipsum dolor sit amet, consectetuer ",
    "adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam ",
    "erat volutpat.\n Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit ",
    "lobortis nisl ut aliquip ex ea commodo consequat.\n Duis autem vel eum iriure dolor in ",
    "hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla ",
    "facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum ",
    "zzril delenit augue duis dolore te feugait nulla facilisi.\n Nam liber tempor cum soluta ",
    "nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim ",
    "assum.\n Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh ",
    "euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.\n Ut wisi enim ad minim ",
    "veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea ",
    "commodo consequat.\n Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse ",
    "molestie consequat, vel illum dolore eu feugiat nulla facilisis.\n At vero eos et accusam ",
    "et justo duo dolores et ea rebum.\n Stet clita kasd gubergren, no sea takimata sanctus est ",
    "Lorem ipsum dolor sit amet.\n Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed ",
    "diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam ",
    "voluptua.\n At vero eos et accusam et justo duo dolores et ea rebum.\n Stet clita kasd ",
    "gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\n Lorem ipsum dolor ",
    "sit amet, consetetur sadipscing elitr,  At accusam aliquyam diam diam dolore dolores ",
    "duo eirmod eos erat, et nonumy sed tempor et et invidunt justo labore Stet clita ea et ",
    "gubergren, kasd magna no rebum.\n sanctus sea sed takimata ut vero voluptua.\n est Lorem ",
    "ipsum dolor sit amet.\n Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed ",
    "diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat.",
    "Consetetur sadipscing elitr,  sed diam nonumy eirmod tempor invidunt ut labore et ",
    "dolore magna aliquyam erat, sed diam voluptua.\n At vero eos et accusam et justo duo ",
    "dolores et ea rebum.\n Stet clita kasd gubergren, no sea takimata sanctus est Lorem ",
    "ipsum dolor sit amet.\n Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed ",
    "diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam ",
    "voluptua.\n At vero eos et accusam et justo duo dolores et ea rebum.\n Stet clita kasd ",
    "gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\n Lorem ipsum dolor ",
    "sit amet, consetetur sadipscing elitr,  sed diam nonumy eirmod tempor invidunt ut ",
    "labore et dolore magna aliquyam erat, sed diam voluptua.\n At vero eos et accusam et ",
    "justo duo dolores et ea rebum.\n Stet clita kasd gubergren, no sea takimata sanctus ",
    "est Lorem ipsum dolor sit amet dolore eu feugiat nulla facilisis eirmod tempor."
  ]
  
end
