Bank_tech - Individual Challenge

Installing software

Initially I was planning on creating an app with several different classes and maybe a database. Then upon retrospection I realised that it would be easier and simpler to create a one class app with an empty hash which retained info as opposed to a database.

I used these lines of code to install all of my prerequisite software
To make sure I was using the latest version of ruby - rvm use ruby --latest -–install --default
To generate a gemfile - bundle init
To add an rspec folder and file - bundle add rspecrspec and then rspec --init

Writing the code

Initially I had some difficulty with TDD so I thought it would be best to see if I could write the code in ruby or if it would be best to have a go in JavaScript.

I managed to write the code without the tests the first day but realised that wasn't the exercise or what I was meant to do.
I consequentially deleted all of my code and started from scratch with TDD.

(First attempt)

First, I wrote a basic test to make sure that when I called on transactions I was getting an empty array back, there were several errors here until I realised that I was using print/puts instead of return and the console wasn't actually getting any info back to test.

The next function I made was to test if when I made a deposit it would return the correct amount. This brought up several issues initially as I had forgotten how to test if a hash inside an array included a phrase. It was working at the start but with addition of Time.now, it broke it every time. This was fixed by setting a variable equal to that particular hash and testing to see if the rest of the info was correct in there. I looked it up and was considering testing for Time.now but even after research I was rather unclear of how to pause time to test it.

I then tested for withdraw by writing a similar piece of code to the previous test but with adding a step for withdrawing the amount and also by changing the .first method to the [0] method.

My final test I made was to make sure that an error was properly raised if I tried to withdraw more than I had entered into the account. This again was difficult to remember initially but I had a look at some of my previous notes and input it. I had some issue with how to raise the error but managed to figure it out.

(Second Attempt)

I since went and had a look at the self-assesment questions and realised that I hadn't completed everything to the level that I should be.

I went back and had a long think about how I could use multiple classes and how it would make it easier. It did not help and I am still slightly confused why it is better for small programs, but I had a crack at it. The first task was making a new transactions class with TDD which was not too difficult.

From there i went about editing all of the other methods to accept the new class and implement it. The majority of them weren't too difficult until the statement method which I could not get to pass for a considerable while due to when getting passed withdraw's or deposits the nil would throw an error so I added in these lines to replace the nil with a " "
        credit = transaction.credit ? '%.2f' % transaction.credit : ''
        debit = transaction.debit ? '%.2f' % transaction.debit : ''

I used TDD with the new changes and it wan't too difficult to edit the tests, the one Issue I faced there was that I couldn't get the include function to work so I had to make it so the the whole of the returned function was tested

