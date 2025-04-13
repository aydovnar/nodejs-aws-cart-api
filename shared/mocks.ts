
export const cart = [
  {
    product: {
      id: '0e121f52-0864-4365-9fae-8ec39506f575',
      title: 'Phone',
      description: 'Great Phone',
      price: 60,
    },
    count: 2,
  },
  {
    product: {
      id: '0a199426-2bbf-4f57-93bf-0921ae620392',
      title: 'Camera',
      description: 'Professional camera',
      price: 10,
    },
    count: 2,
  },
  {
    product: {
      id: '3413f39e-2a78-459f-870b-1fd33c080da0',
      title: 'Watch',
      description: 'Smart watch',
      price: 21,
    },
    count: 2,
  },
];

export const order = [
  {
    id: '50eebc99-9c0b-4ef8-bb6d-6bb9bd380aa2',
    userId: 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22',
    cartId: 'f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a66',
    address: {
      address: 'Street 1',
      firstName: 'Peter',
      lastName: 'Carrick',
      comment: 'Evening',
    },
    statusHistory: [],
    items: [
      {
        count: 5,
        productId: '0e121f52-0864-4365-9fae-8ec39506f575',
      },
    ],
  },
  {
    id: '40eebc99-9c0b-4ef8-bb6d-6bb9bd380aa1',
    userId: 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11',
    cartId: 'e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a55',
    address: {
      address: 'Street 2',
      firstName: 'Casper',
      lastName: 'Smith',
      comment: 'Evening',
    },
    statusHistory: [],
    items: [
      {
        count: 4,
        productId: '9c537713-2ca8-4dce-b3ca-21af2530c286',
      },
    ],
  },
];
