import tensorflow as tf
import numpy as np

# Load the TFLite model
model_path = 'assets/models/MobileNet_V2.tflite'  # Update with the actual path
interpreter = tf.lite.Interpreter(model_path=model_path)
interpreter.allocate_tensors()

# Get input and output tensors
input_details = interpreter.get_input_details()
output_details = interpreter.get_output_details()

# Prepare your input data (e.g., an image)
# Example input data: a random array with the correct shape and dtype
input_data = np.random.random_sample(input_details[0]['shape']).astype(np.float32)  # Replace with your actual data

# Set the input tensor
interpreter.set_tensor(input_details[0]['index'], input_data)

# Run inference
interpreter.invoke()

# Get the output tensor
output_data = interpreter.get_tensor(output_details[0]['index'])

# Process the output
print('Output:', output_data)
