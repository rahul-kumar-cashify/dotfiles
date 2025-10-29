tensor any mathematicl object or just some array


**Note:** 
tensors datatypes is one of f3 big erros with pytorch 

tensors not right datatypes
tensros not right shape
tensor not on right device


require_grad

pytorch track gradient
gradient ??





zz = torch.zeros(2,3)
zz.dtype
i = zz.type(torch.int8)
i.dtype

stack?
hstack
vstack


# setup device agnostic code
device = "cuda"



4 23 start model training



Absolutely! Here's the **entire PyTorch core workflow as structured notes**, written concisely and clearly for reference or revision.

---

## 🧠 PyTorch Core Concepts – Notes Format

---

### 1. **`nn.Parameter`**

* A special kind of tensor registered as a **learnable parameter**.
* Automatically appears in `model.parameters()` and gets updated during training.
* Used when you define **custom weights** manually.

```python
self.weight = nn.Parameter(torch.randn(10, 10))
```

---

### 2. **`nn.Module`**

* Base class for **all models and layers** in PyTorch.
* Automatically tracks:

  * Submodules (`nn.Linear`, `nn.Conv2d`, etc.)
  * Parameters (`nn.Parameter`)
* You must define an `__init__` constructor and a `forward()` method.

```python
class MyModel(nn.Module):
    def __init__(self):
        super().__init__()
        self.linear = nn.Linear(10, 5)

    def forward(self, x):
        return self.linear(x)
```

---

### 3. **`forward()`**

* Required method in `nn.Module`.
* Defines **how input data flows** through the model.
* Called when you run `model(input)`.

---

### 4. **`torch.optim`**

* Module that provides various **optimization algorithms**:

  * `SGD`, `Adam`, `RMSprop`, `AdamW`, etc.
* Optimizers update parameters to minimize loss using gradients.

**Basic usage:**

```python
optimizer = torch.optim.Adam(model.parameters(), lr=0.001)

optimizer.zero_grad()   # Clear old gradients
loss.backward()         # Backpropagation
optimizer.step()        # Update weights
```

---

### 5. **`torch.utils.data.Dataset`**

* Abstract class for representing your dataset.
* You define how to load individual data points.

Must implement:

* `__len__()` → total number of samples
* `__getitem__(index)` → fetch one sample

```python
class MyDataset(Dataset):
    def __init__(self, data, labels):
        self.data = data
        self.labels = labels

    def __len__(self):
        return len(self.data)

    def __getitem__(self, idx):
        return self.data[idx], self.labels[idx]
```

---

### 6. **`torch.utils.data.DataLoader`**

* Wraps a Dataset to:

  * Load data in batches
  * Shuffle data
  * Use multiprocessing
* Essential for training with large datasets.

```python
dataloader = DataLoader(dataset, batch_size=32, shuffle=True)
```

---

## ✅ Summary Table

| Concept        | Role                     | Notes                                     |
| -------------- | ------------------------ | ----------------------------------------- |
| `nn.Parameter` | Trainable tensor         | Used when manually defining weights       |
| `nn.Module`    | Model/layer base class   | Manages parameters and forward pass       |
| `forward()`    | Input → Output logic     | Defined in every `nn.Module` subclass     |
| `torch.optim`  | Updates model parameters | Uses gradients from `.backward()`         |
| `Dataset`      | Custom data handling     | You write `__getitem__()` and `__len__()` |
| `DataLoader`   | Efficient data feeding   | Batching, shuffling, and multiprocessing  |

---

Would you like a printable version or a cheatsheet for this?



torch inderence_mode()

y_pred

turns off gradient descent


learning rate scheduling

how learning rate matterss


logit in tensorflow


torchmetrics
------------------
accuracy
revisionrecall
F1-score
confusion matrix
classification report



# Save the best model after training is complete
torch.save(best_model_wts, "best_model.pth")
print("Best model saved to 'best_model.pth'")

# Optionally, save the complete model (including architecture and weights)
torch.save(model, "model_complete.pth")
print("Complete model saved to 'model_complete.pth'")

