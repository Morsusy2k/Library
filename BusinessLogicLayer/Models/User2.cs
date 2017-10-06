﻿using System;
using System.Diagnostics;

namespace Library.BusinessLogicLayer.Models
{
    public class User2
    {
        private string name, userName, password, email;
        private DateTime dateJoined;

        public User2() { }
        public User2(string name, string userName, string password, string email, DateTime dateJoined, DateTime? dateOfBirth = null) { }

        public int Id { get; set; }
        public string Name
        {
            get
            {
                Debug.Assert(name != null);
                return name;
            }

            set
            {
                if (value == null)
                    throw new ArgumentNullException("Name", "Valid name is mandatory!");

                string oldValue = name;
                try
                {
                    name = value;
                }
                catch
                {
                    name = oldValue;
                    //throw;
                }
            }
        }

        public string UserName
        {
            get
            {
                Debug.Assert(userName != null);
                return userName;
            }

            set
            {
                if (value == null)
                    throw new ArgumentNullException("userName", "Valid username is mandatory!");

                string oldValue = userName;
                try
                {
                    userName = value;
                }
                catch
                {
                    userName = oldValue;
                    //throw;
                }
            }
        }

        public string Password
        {
            get
            {
                Debug.Assert(password != null);
                return password;
            }

            set
            {
                if (value == null)
                    throw new ArgumentNullException("password", "Valid password is mandatory!");

                string oldValue = password;
                try
                {
                    password = value;
                }
                catch
                {
                    password = oldValue;
                    //throw;
                }
            }
        }

        public string Email
        {
            get
            {
                Debug.Assert(email != null);
                return email;
            }

            set
            {
                if (value == null)
                    throw new ArgumentNullException("email", "Valid email is mandatory!");

                string oldValue = email;
                try
                {
                    email = value;
                }
                catch
                {
                    email = oldValue;
                    //throw;
                }
            }
        }

        public DateTime DateJoined
        {
            get
            {
                Debug.Assert(dateJoined != null);
                return dateJoined;
            }

            set
            {
                if (value == null)
                    throw new ArgumentNullException("dateJoined", "Valid dateJoined is mandatory!");

                DateTime oldValue = dateJoined;
                try
                {
                    dateJoined = value;
                }
                catch
                {
                    dateJoined = oldValue;
                    //throw;
                }
            }
        }

        public DateTime? DateOfBirth { get; set; }

    }
}
