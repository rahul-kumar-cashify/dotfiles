# AI 
machines mimicking human intelligence and cognitive functions 

## Supervised Learning
Supervised learning is feeding the model input (x) along with labeled data ➔ expected output (y), so the black box (model) learns to predict y from x.

### Uses
 - Medical diagnosis: Predicting diseases from patient data with known outcomes.
 - Image classification: Identifying objects (e.g., cats, dogs) in images based on labeled data.
 - Sales forecasting: Predicting future sales based on past labeled data.
 - Sentiment analysis: Classifying text as positive, negative, or neutral using labeled data.


## Semi-supervised Learning
Semi-supervised learning is a combination of supervised and unsupervised learning, where the model is trained on a small amount of labeled data and a large amount of unlabeled data to improve accuracy.

## Unsupervised Learning
Unsupervised learning is when the model is given only input data (x) without any labeled output (y).
 The model tries to find patterns, groups, or structures hidden in the data by itself.
### Why use it?
- When labeled data is scarce or expensive to obtain.
- To uncover hidden patterns or insights that are not immediately obvious.

Customer Segmentation: Group customers by buying habits for personalized suggestions.
Example: Amazon recommends products based on purchase patterns.

Anomaly Detection: Spot unusual events like fraud by finding data outliers.
Example: Visa flags suspicious credit card activity.

Data Compression: Shrink data size without losing important info.
Example: Netflix compresses videos to save space while keeping quality.

Market Basket Analysis: Find product pairs often bought together.
Example: Walmart promotes items like bread and butter bought together.

Dimensionality Reduction: Cut down features while keeping key patterns.
Example: Google simplifies image data to improve search accuracy.

## Reinforcement Learning
Reinforcement Learning (RL) is a type of machine learning where an agent learns to make decisions by interacting with an environment. The agent receives rewards or penalties based on its actions and aims to maximize the cumulative reward over time.

### Example Use Cases:
**Game playing**: AlphaGo, developed by DeepMind, used RL to master the game of Go by learning optimal moves.
**Robotics**: Robots like Boston Dynamics' Atlas use RL to learn how to walk and perform complex tasks.
**Autonomous vehicles**: Self-driving cars use RL to make decisions like when to stop or turn to reach a destination safely.

## How deep learning works
https://www.ibm.com/think/topics/deep-learning
https://developer.ibm.com/articles/cc-machine-learning-deep-learning-architectures/

Deep neural networks consist of multiple layers of interconnected nodes, each building on the previous layer to refine and optimize the prediction or categorization. 
- This progression of computations through the network is called forward propagation.
- Another process called backpropagation uses algorithms, such as gradient descent, to calculate errors in predictions, and then adjusts the weights and biases of the function by moving backwards through the layers to train the model.

# CNNs
https://stanford.edu/~shervine/teaching/cs-230/cheatsheet-convolutional-neural-networks
Convolutional neural networks (CNNs or ConvNets) are used primarily in computer vision and image classification applications. 
They can detect features and patterns within images and videos, enabling tasks such as object detection, image recognition, pattern recognition and face recognition. 
These networks harness principles from linear algebra, particularly matrix multiplication, to identify patterns within an image.

CNNs are a specific type of neural network, which is composed of node layers, containing an input layer, one or more hidden layers and an output layer. 
Each node connects to another and has an associated weight and threshold. 
If the output of any individual node is above the specified threshold value, that node is activated, sending data to the next layer of the network. 
Otherwise, no data is passed along to the next layer of the network.

```
Input Image: A 3D matrix (Height × Width × Channels).
   - Example: A color image has 3 channels: Red, Green, Blue (RGB).

Filter (Kernel): A small matrix (e.g., 3×3) that slides over the image to detect patterns like edges or textures.

Stride: The number of pixels the filter moves at each step (usually 1).

Convolution Operation:
   - Multiply filter values with the image patch it overlaps.
   - Sum the result (dot product).

Feature Map: The output of the convolution; a 2D array showing where patterns were found.
   - It's a feature activation — it tells you how strongly the pattern (defined by the filter) appears in that specific region of the image.
   - A higher number means the filter matched that part of the image well.
   - A lower or negative number means a weak or no match.

Input Image Matrix:
1 1 1 0 0
0 1 1 1 0
0 0 1 1 1
0 0 1 1 0
0 1 1 0 0

Filter (Kernel):
1 0 1
0 1 0
1 0 1

Step-by-Step: Convolution with Stride = 1

Image patch:
1 1 1
0 1 1
0 0 1

Filter:
1 0 1
0 1 0
1 0 1

Dot Product:
(1×1 + 1×0 + 1×1) + (0×0 + 1×1 + 1×0) + (0×1 + 0×0 + 1×1)
= (1 + 0 + 1) + (0 + 1 + 0) + (0 + 0 + 1) = **4**

Feature map (after sliding the filter across the image):
4  3  2
2  4  3
1  2  3

Apply ReLU Activation:
ReLU(x) = max(0, x)

Pipeline:
Input Image → Convolution (with Filter) → Feature Map → ReLU → Pooling → Next Layer
```


# Pooling Layers
- **Pooling layers** (downsampling) reduce input dimensions and parameters.
- A **filter** moves across the input, similar to convolution, but **without weights**.
- It uses an **aggregation function** (e.g., max or average) on each region.
- This helps reduce computation and makes the model more robust.
- **Types of pooling**:
  - **Max Pooling** – picks the highest value.
  - **Average Pooling** – computes the average value. 

- It’s often placed after convolutional layers to gradually downsample the representation.

### Common Types of Pooling:

1. **Max Pooling**  
   - Takes the **maximum value** in each patch of the feature map.  
   - Example:  
     From a 2×2 patch: `[1, 3; 2, 4]` → output: `4`.

2. **Average Pooling**  
   - Takes the **average** of the values in the patch.  
   - Same patch: `[1, 3; 2, 4]` → output: `2.5`.

### Example (Max Pooling with 2×2 filter and stride 2):

```
Input:
[[1, 3, 2, 1],
 [4, 6, 5, 2],
 [7, 8, 9, 3],
 [1, 2, 3, 4]]

After 2x2 Max Pooling → Output:
[[6, 5],
 [8, 9]]
```



====================================================
|       Convolutional vs Fully Connected Layer     |
====================================================

1. Connection Pattern
---------------------
Convolutional:
- Each neuron connects to a LOCAL region (receptive field).
- Sparse and structured connections.
- Uses a shared kernel (filter).
- Same weights are applied across different regions.
- Works with 2D or 3D inputs (e.g., images with channels).
- Preserves spatial structure (height, width, position).
- Used in early and middle layers for feature extraction.


  ✅ **Used by:**
  - **Google Photos** for object/face detection.
  - **Tesla** for real-time object detection in self-driving.
  - **Meta** (Facebook, Instagram) for image and video tagging.
  - **Pinterest** for visual search and recommendations.

  Example (3×3 Kernel on 5×5 Input):
    Input:
      [ i11 ][ i12 ][ i13 ][ i14 ][ i15 ]
      [ i21 ][ i22 ][ i23 ][ i24 ][ i25 ]
      [ i31 ][ i32 ][ i33 ][ i34 ][ i35 ]
      [ i41 ][ i42 ][ i43 ][ i44 ][ i45 ]
      [ i51 ][ i52 ][ i53 ][ i54 ][ i55 ]
    
    Kernel:
      [ k11 ][ k12 ][ k13 ]
      [ k21 ][ k22 ][ k23 ]
      [ k31 ][ k32 ][ k33 ]
    
    o11 = k11·i11 + k12·i12 + ... + k33·i33  
    (Same kernel slides to produce o12, o13, etc.)

Fully Connected:
- Every neuron connects to ALL neurons in the previous layer.
- Dense connections.
- Each connection has its own unique weight.
- Total weights = input_size × output_size.
- Requires input to be flattened into a 1D vector.
- Loses spatial information due to flattening.
- Used in final layers for classification or regression.

✅ **Used by:**
- **Amazon Alexa / Google Assistant** for final intent classification.
- **Netflix** for user rating predictions and recommendations.
- **Apple** (Siri, Face ID) to make final identification decisions.
- **Credit scoring systems** in finance (e.g., Capital One, FICO).

  Example (4 inputs → 3 outputs):
    Inputs:  [ i1 ][ i2 ][ i3 ][ i4 ]
    Outputs: [ o1 ][ o2 ][ o3 ]
    
    Each oN = w1·i1 + w2·i2 + w3·i3 + w4·i4 (with unique weights for each)


### Links
📘 Learn more: 
[NVIDIA DL Guide - Fully Connected Layers](https://docs.nvidia.com/deeplearning/performance/dl-performance-fully-connected/index.html)
https://proceedings.neurips.cc/paper_files/paper/2012/file/c399862d3b9d6b76c8436e924a68c45b-Paper.pdf
https://arxiv.org/pdf/1512.03385v1
====================================================



# RNNs
https://stanford.edu/~shervine/teaching/cs-230/cheatsheet-recurrent-neural-networks
Recurrent neural networks (RNNs) are typically used in natural language and speech recognition applications as they use sequential or time-series data. 
RNNs are great at predicting what comes next based on past patterns.
RNN models are mostly used in the fields of natural language processing and speech

RNNs use their “memory” as they take information from prior inputs to influence the current input and output. 
While traditional deep neural networks assume that inputs and outputs are independent of each other, the output of RNNs depends on the prior elements within the sequence. 
While future events would also be helpful in determining the output of a given sequence, unidirectional recurrent neural networks cannot account for these events in their predictions.

Variant ??
Problems ??

Gates ??

# GANs
https://developers.google.com/machine-learning/gan/gan_structure
Generative adversarial networks (GANs)
- The **generator** learns to generate plausible data. The generated instances become negative training examples for the discriminator.
- The **discriminator** learns to distinguish the generator's fake data from real data. The discriminator penalizes the generator for producing implausible results.


Diffusion models ??
Transformer models ??


## Need to go over them
### Modern Architectures
 AlexNet: ReLU, dropout, early GPU usage
 VGG: Deep, uniform kernel sizes (3×3)
 GoogLeNet / Inception: multi-scale filters
 ResNet: residual blocks, vanishing gradient solution
 Optionally: DenseNet, EfficientNet, MobileNet

https://developer.ibm.com/articles/neural-networks-from-scratch/

## Stanford Course: CS231n Deep Learning for Computer Vision
https://cs231n.github.io/
https://cs231n.stanford.edu/schedule.html


# AI agents vs. AI assistants
## https://www.ibm.com/think/topics/ai-agents-vs-ai-assistants
The key difference between an artificial intelligence (AI) assistant and an AI agent is similar. AI assistants are reactive, performing tasks at your request. AI agents are proactive, working autonomously to achieve a specific goal by any means at their disposal.

AI assistants are built by a foundation model (for example, IBM® Granite™, Meta’s Llama models or OpenAI’s models). 
Large language models (LLMs) are a subset of foundation models that specialize in text-related tasks, and provide relevant response.


AI agent refers to a system or program that can autonomously complete tasks on behalf of users or another system by designing its own workflow and by using available tools.

More autonomous, connected and sophisticated than AI assistants, AI agents can encompass a wide range of functions beyond NLP. 
These include decision-making, problem-solving, interacting with external environments and executing actions.


# Layers
## Linear

The linear layer is like a fully connected layer that takes the input vector and transforms it by applying a learned weighted sum plus bias:

$$
y = Wx + b
$$


## Conv2D Notes

- **Filter:** small matrix (e.g., 3×3)  
- Slides over input image or feature map  
- At each position (i, j), calculates:  
  \[
  y[i, j] = \sum_k (m[k] \times x[i + k_{row}, j + k_{col}]) + bias
  \]  
- Output \(y\) is called the **feature map**  
- Feature map shows where the filter pattern matches the input  
- Filter weights (\(m\)) and bias are **learnable parameters**, adjusted during training  
- Helps the model detect patterns like edges, shapes, and objects step-by-step

## BatchNorm
BatchNorm normalizes the inputs — it takes the input values and:

Centers them → by subtracting the mean

Scales them → by dividing by the standard deviation (square root of variance)




Here’s a simple explanation of **ReLU** and why it’s used:

---

### What is ReLU?

* ReLU stands for **Rectified Linear Unit**.
* It’s a function applied to each number in the input.
* It replaces every negative value with zero and keeps positive values as they are.
* Mathematically:

  $$
  \text{ReLU}(x) = \max(0, x)
  $$

---

### Why do we introduce ReLU?

* Adds **non-linearity** to the model so it can learn complex patterns.
* Helps the network **train faster** and reduces the chance of vanishing gradients (where the model stops learning).
* Simple and efficient to compute.


Adding **non-linearity** means making the model able to understand and learn things that aren’t just straight lines or simple patterns.

Without ReLU, the model can only make decisions based on simple, straight-line math — which limits what it can learn.

With ReLU, the model can combine lots of simple things in different ways to understand more complicated, real-world patterns like faces, voices, or handwriting.

------------------------------------------------------------------------------------------------------------------------------------------------------------------

## What is AdaptiveAvgPool2d?
It’s a layer that reduces the size of an input feature map by averaging values inside fixed regions.

Unlike normal average pooling, you don’t specify the size of the pooling window — instead, you specify the output size you want.

The layer automatically figures out how big each pooling region should be to produce that output size.

It works on 2D inputs like images or feature maps.




machine learning 
data -> number -> find pattern in number

deep learning
when data is structured
