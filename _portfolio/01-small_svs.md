---
title: "Task Dependent Importance of Small Singular Values During Fine-Tuning"
excerpt: "We demonstrate that small singular values of play a crucial role in transformer alignment during fine-tuning.<br/><img src='/images/small_svs/qnli_all_cropped.png' style='width: 350px; height: auto'>"
collection: portfolio
permalink: /portfolio/small-singular-values/
layout: archive
weight: 1
---
*View the full project on [GitHub](https://github.com/aidanconnerly/small_svs)*

<figure style="display: block; margin: auto; text-align: center;">
    <img src="{{aidanconnerly.github.io}}/images/small_svs/qnli_all_cropped.png" alt="qnli-small-svs" style="display: block; margin: auto; width: 500px; height: auto;" />
</figure>

## Short Description
In this project, I removed singular values from a fine-tuned transformer to study their role in model alignment. I discovered that the smallest singular values are critical during early fine-tuning, but their importance fades with longer training. These results suggest opportunities for smarter, layer specific pruning strategies via singular value decomposition.

## Abstract
Singular value decomposition (SVD) is vital for model compression, enabling matrix approximation with fewer parameters. In this work, we systematically remove singular values (SVs) from fine-tuned DistilBERT models across GLUE tasks of varying complexity. Our experiments show that small SVs are essential for complex reasoning during early fine-tuning, though their importance diminishes with prolonged training. We localize these performance-critical small SVs primarily to early feed-forward network layers in the transformer. These findings enable optimized compression schemes that preserve essential small SVs in critical regions while permitting aggressive pruning elsewhere.

[Link to paper](https://github.com/aidanconnerly/small_svs/blob/main/report.pdf)