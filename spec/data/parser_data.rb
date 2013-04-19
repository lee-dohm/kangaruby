#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module TestData
  ONE_ACTIVITY = <<-EOS
Alice->Bob
EOS

  TWO_ACTIVITIES = <<-EOS
Alice->Bob
Bob-->Alice
EOS

  SYNTAX_ERROR = <<-EOS
Alice
EOS
end
