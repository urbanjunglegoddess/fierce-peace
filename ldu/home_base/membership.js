import React, { useState } from 'react';
import axios from 'axios';

function MembershipApplication() {
  const [firstName, setFirstName] = useState('');
  const [lastName, setLastName] = useState('');
  const [email, setEmail] = useState('');
  const [phone, setPhone] = useState('');
  const [address, setAddress] = useState('');
  const [city, setCity] = useState('');
  const [state, setState] = useState('');
  const [zip, setZip] = useState('');
  const [reason, setReason] = useState('');

  const handleSubmit = (event) => {
    event.preventDefault();
    // Send membership application data to API
    axios.post('/api/membership-application', {
      firstName,
      lastName,
      email,
      phone,
      address,
      city,
      state,
      zip,
      reason
    })
      .then(response => {
        // Handle successful submission
        console.log(response.data);
        alert('Thank you for your membership application! We will be in touch soon.');
      })
      .catch(error => {
        // Handle error
        console.log(error);
        alert('Sorry, there was an error submitting your membership application. Please try again later.');
      });
  };

  return (
    <div className="membership-application">
      <h2>Membership Application</h2>
      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label htmlFor="firstName">First Name:</label>
          <input type="text" id="firstName" value={firstName} onChange={event => setFirstName(event.target.value)} required />
        </div>
        <div className="form-group">
          <label htmlFor="lastName">Last Name:</label>
          <input type="text" id="lastName" value={lastName} onChange={event => setLastName(event.target.value)} required />
        </div>
        <div className="form-group">
          <label htmlFor="email">Email:</label>
          <input type="email" id="email" value={email} onChange={event => setEmail(event.target.value)} required />
        </div>
        <div className="form-group">
          <label htmlFor="phone">Phone:</label>
          <input type="tel" id="phone" value={phone} onChange={event => setPhone(event.target.value)} required />
        </div>
        <div className="form-group">
          <label htmlFor="address">Address:</label>
          <input type="text" id="address" value={address} onChange={event => setAddress(event.target.value)} required />
        </div>
        <div className="form-group">
          <label htmlFor="city">City:</label>
          <input type="text" id="city" value={city} onChange={event => setCity(event.target.value)} required />
        </div>
        <div className="form-group">
          <label htmlFor="state">State:</label>
          <input type="text" id="state" value={state} onChange={event => setState(event.target.value)} required />
        </div>
        <div className="form-group">
          <label htmlFor="zip">Zip Code:</label>
          <input type="text" id="zip" value={zip} onChange={event => setZip(event.target.value)} required />
        </div>
        <div className="form-group">
          <label htmlFor="reason">Reason for joining:</label>
          <textarea id="reason" value={reason} onChange={event => setReason(event.target.value)} required></textarea>
        </div>
        <button type="submit">Submit Application</button>