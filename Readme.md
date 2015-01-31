yGlow
=====

- [yglow.dev](http://yglow.dev)
- [Heroku][heroku]
- [Next steps][issues]


State of affairs
----------------

1. Open [yglow.herokuapp.com][heroku] on various devices (or open the [test.html][test] 

2. Every new device will get another colour

3. Run the special script on the phone:

        ssh phone
        screen
        # This script has to be run three times first
        ruby /home/pi/gpio-ruby/yglow.rb &
        # Close the window
        
4. Dial a number on the phone and the "lamps" will change their color. Alternatively open the [ping URL][ping] in a browser. 


Deployment
----------

    git push heroku develop:master --force
    

    
[issues]: http://bitbucket.org/beat_besmer/yglow/issues    
[test]: http://yglow.herokuapp.com/test.html
[heroku]: https://yglow.herokuapp.com
[ping]: https://yglow.herokuapp.com/api/ping/1
