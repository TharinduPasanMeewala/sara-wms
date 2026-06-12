// middleware.js
const authMiddleware = (req, res, next) => {
  // Authentication logic here
  const token = req.headers['authorization'];
  if (!token) return res.status(401).json({ message: 'Unauthorized' });
  // Validate token...
  next();
};

const validate = (schema) => {
  return (req, res, next) => {
    const { error } = schema.validate(req.body);
    if (error) return res.status(400).json({ message: error.details[0].message });
    next();
  };
};

module.exports = { auth: authMiddleware, validate };