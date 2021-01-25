import array
from matplotlib import pyplot as plt
import numpy as np

def normalize(x, method='max'):
    if method == 'max':
        y = x - x.mean()
        y /= x.max()
        return y
    else:
        raise ValueError('Invalid argument `method`.')

def mse(x, y, mask=None):
    if mask is None:
        return ((x - y) ** 2).mean()
    return ((mask * (x - y)) ** 2).sum() / mask.sum()

def psnr(x, y, imax=None, mask=None):
    m = mse(x, y, mask)
    if imax is None:
        imax = x.max()
    return 20 * np.log10(imax) - 10 * np.log10(m)

def read_array(filename, num_elements, typecode):
    a = array.array(typecode)
    with open(filename, 'rb') as f:
        a.fromfile(f, num_elements)
    return a

def read_sinogram(filename, w, h, p):
    return np.array(read_array(filename, w * h * p, 'f')).reshape([p, h, w])

if __name__ == '__main__':
    w = 128
    h = 342
    p = 120
    num_elements = w * h * p
    filename_in = './mdp_wb_128x342x120_nn10_d1222_01_tot_w1.a00'
    filename_label = './mdp_wb_128x342x120_nn100_d1222_01_air_w1.a00'
    imgs_in = read_sinogram(filename_in, w, h, p)
    imgs_label = read_sinogram(filename_label, w, h, p)
    plt.subplot(1, 2, 1)
    plt.imshow(imgs_in[:, 80, :])
    plt.subplot(1, 2, 2)
    plt.imshow(imgs_label[:, 80, :])
    plt.show()
    mask = (normalize(imgs_label, 'max') > 0.05)
    # mask = np.ones_like(imgs_in)
    print('PSNR: ', psnr(normalize(imgs_in, 'max'), 
                         normalize(imgs_label, 'max'), 1, mask))