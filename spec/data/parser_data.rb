#
# Copyright (c) 2013 by Lifted Studios.  All Rights Reserved.
#

module TestData
  ONE_ACTION = <<-EOS
Alice->Bob
EOS

  TWO_ACTIONS = <<-EOS
Alice->Bob
Bob-->Alice
EOS

  SYNTAX_ERROR = <<-EOS
Alice
EOS
end
