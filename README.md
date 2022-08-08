# Stroke extraction based on ambiguous zone detection

## Introduction
In this repo, a stroke extraction algorithm is implemented in Matlab. Degrade spurrious branches or skeleton deformations.maximum circle criterion and double threshold method.
Used feature points in thinned image and surrounding contour informations.

```mermaid
flowchart TD
    A[Preprocessing] --> B[Feature point detection];
    A[Preprocessing] --> C[Contour extraction];
    subgraph Ambiguity detection
        B[Feature point detection] --> D[Ambiguous zone identification];
        C[Contour extraction] --> D[Ambiguous zone identification];
    end
    subgraph Stroke extraction
        D[Ambiguous zone identification] --> E[Graph representation];
        E[Graph representation] --> F[Continuity analysis];
        F[Continuity analysis] --> G[Stroke path searching];
        G[Stroke path searching] --> H[B-spline interpolation];
    end   
```

## Reference
1. Su, Z., Cao, Z. & Wang, Y. Stroke extraction based on ambiguous zone detection: a preprocessing step to recover dynamic information from handwritten Chinese characters. IJDAR 12, 109–121 (2009). https://doi.org/10.1007/s10032-009-0085-9 

