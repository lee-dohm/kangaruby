#
# Copyright (c) 2013 by Lifted Studios. All Rights Reserved.
#

FactoryGirl.define do
  factory :one_action, class: String do
    skip_create

    initialize_with do
      <<-EOS
      Alice->Bob
      EOS
    end
  end

  factory :two_actions, class: String do
    skip_create

    initialize_with do
      <<-EOS
      Alice->Bob
      Bob-->Alice
      EOS
    end
  end

  factory :syntax_error, class: String do
    skip_create

    initialize_with do
      "Alice\n"
    end
  end
end
