import tensorflow as tf

# Load the TensorFlow SavedModel
saved_model_dir = r"C:\Users\tamiz\Downloads\mobilenetv2"




# Convert the model
converter = tf.lite.TFLiteConverter.from_saved_model(saved_model_dir)
tflite_model = converter.convert()

# Save the converted model
with open("model.tflite", "wb") as f:
    f.write(tflite_model)

print("Model conversion complete. Check for 'model.tflite'.")
