# Intro to Auth

## Using this app

Create a file in the root directory named `.env`. In it, define the session secret with

```
SESSION_SECRET=<Your secret here>
```

6:25: Adding cost!

## Authorization

Give allowance for something


## Authentication

We must *never*, as developers, even in our own apps that we're building for fun, store passwords in plaintext.

Enter bcrypt, and has_secure_password.

By saving a column to our database called password_digest that takes in a string, installing the bcrypt gem, and then adding has_secure_password to our model, we can quickly move to a very secure method of storing passwords.

### How `bcrypt()` works
This section stolen wholesale from the [bcrypt gem README](https://github.com/bcrypt-ruby/bcrypt-ruby/blob/master/README.md#how-bcrypt-works)

`bcrypt()` is a hashing algorithm designed by Niels Provos and David Mazières of the OpenBSD Project.

### Background

Hash algorithms take a chunk of data (e.g., your user's password) and create a "digital fingerprint," or hash, of it.
Because this process is not reversible, there's no way to go from the hash back to the password.

In other words:

    hash(p) #=> <unique gibberish>

You can store the hash and check it against a hash made of a potentially valid password:

    <unique gibberish> =? hash(just_entered_password)

### Rainbow Tables

But even this has weaknesses -- attackers can just run lists of possible passwords through the same algorithm, store the
results in a big database, and then look up the passwords by their hash:

    PrecomputedPassword.find_by_hash(<unique gibberish>).password #=> "secret1"

### Salts

The solution to this is to add a small chunk of random data -- called a salt -- to the password before it's hashed:

    hash(salt + p) #=> <really unique gibberish>

The salt is then stored along with the hash in the database, and used to check potentially valid passwords:

    <really unique gibberish> =? hash(salt + just_entered_password)

bcrypt-ruby automatically handles the storage and generation of these salts for you.

Adding a salt means that an attacker has to have a gigantic database for each unique salt -- for a salt made of 4
letters, that's 456,976 different databases. Pretty much no one has that much storage space, so attackers try a
different, slower method -- throw a list of potential passwords at each individual password:

    hash(salt + "aadvark") =? <really unique gibberish>
    hash(salt + "abacus")  =? <really unique gibberish>
    etc.

This is much slower than the big database approach, but most hash algorithms are pretty quick -- and therein lies the
problem. Hash algorithms aren't usually designed to be slow, they're designed to turn gigabytes of data into secure
fingerprints as quickly as possible. `bcrypt()`, though, is designed to be computationally expensive:

    Ten thousand iterations:
                 user     system      total        real
    md5      0.070000   0.000000   0.070000 (  0.070415)
    bcrypt  22.230000   0.080000  22.310000 ( 22.493822)

If an attacker was using Ruby to check each password, they could check ~140,000 passwords a second with MD5 but only
~450 passwords a second with `bcrypt()`.

## Authorization

### The Session:

The session is a hash.

  configure do
    set(:views, 'app/views')
    set :public_folder, 'public'
    enable :sessions
    set :session_secret, <YOUR SECRET>
  end
