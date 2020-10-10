import matplotlib.pyplot as plt
import numpy as np

def is_on_line_segment(x0,y0,x1,y1,px,py):
    # the line segment is defined using two points: (x0,y0) and (x1,y1)
    x_in_range = ((px - x0) * (px - x1)) <= 0
    y_in_range = ((py - y0) * (py - y1)) <= 0
    return x_in_range and y_in_range
    
def is_paralle(x0,y0,x1,y1,x2,y2,x3,y3):
    # two lines. 1st line (x0,y0,x1,y1), 2nd line (x2,y2,x3,y3)
    eq = (x0 - x1) * (y2 - y3) - (y0 - y1) * (x2 - x3)
    return eq == 0

def is_line_colinear_when_parallel(x0,y0,x1,y1,x2,y2,x3,y3):
    # assume we already know these two lines are PARALLE
    if x0 != x1:
        # slope exists
        #line 0
        k0 = (y0-y1)/(x0-x1)
        b0 = y0 - k0 * x0
        #line 1
        k1 = (y2-y3)/(x2-x3)
        b1 = y2 - k1 * x2
        return (k0 == k1) and (b0 == b1)
    else:
        # vertical
        return x0 == x2

def is_line_segment_colinear_when_parallel(x0,y0,x1,y1,x2,y2,x3,y3):
    if not is_line_colinear_when_parallel(x0,y0,x1,y1,x2,y2,x3,y3):
        return False
    if x0 != x1:
        is_x2_in_l0 = ((x2 - x0) * (x2 - x1)) <= 0
        is_x3_in_l0 = ((x3 - x0) * (x3 - x1)) <= 0
        return is_x2_in_l0 or is_x3_in_l0
    else:
        # vertical
        is_y2_in_l0 = ((y2 - y0) * (y2 - y1)) <= 0
        is_y3_in_l0 = ((y3 - y0) * (y3 - y1)) <= 0
        return is_y2_in_l0 or is_y3_in_l0

def is_intersected(line0,line1,plot=False):
    line0 = np.array(line0)
    line1 = np.array(line1)
    if plot:
        plt.plot(line0[:,0],line0[:,1],'o-',alpha=0.6)
        plt.plot(line1[:,0],line1[:,1],'o-',alpha=0.6)
        plt.show()
    
    # for line 0
    xs = line0[:,0]
    ys = line0[:,1]
    c1 = ys[0] - ys[1]
    c2 = xs[1] - xs[0]
    c3 = (xs[0] - xs[1]) * ys[0] - (ys[0] - ys[1]) * xs[0]
    # for line 1
    xs = line1[:,0]
    ys = line1[:,1]
    d1 = ys[0] - ys[1]
    d2 = xs[1] - xs[0]
    d3 = (xs[0] - xs[1]) * ys[0] - (ys[0] - ys[1]) * xs[0]
    # try finding the intersection
    A = np.array([[c1, c2], [d1, d2]])
    b = -1 * np.array([c3, d3])
    try:
        x = np.linalg.solve(A, b)
        px, py = x
        # for line 0
        x0, y0 = line0[0,0], line0[0,1]
        x1, y1 = line0[1,0], line0[1,1]
        intersected_on_line0_seg = is_on_line_segment(x0,y0,x1,y1,px,py)
        # for line 1
        x0, y0 = line1[0,0], line1[0,1]
        x1, y1 = line1[1,0], line1[1,1]
        intersected_on_line1_seg = is_on_line_segment(x0,y0,x1,y1,px,py)
        # combine results
        return intersected_on_line0_seg and intersected_on_line1_seg
    except:
        # either parallel, or overlapping
        # if it's overlapped, then intersected
        # for line 0
        x0, y0 = line0[0,0], line0[0,1]
        x1, y1 = line0[1,0], line0[1,1]
        # for line 1
        x2, y2 = line1[0,0], line1[0,1]
        x3, y3 = line1[1,0], line1[1,1]
        colinear = is_line_segment_colinear_when_parallel(x0,y0,x1,y1,x2,y2,x3,y3) # if the two lines are colinear
        # check if two segments are also colinear

        return colinear


if __name__ == "__main__":
	l0 = [[0,1],[0,2]]
	l1 = [[0,1],[0,6]]
	print(is_intersected(l0,l1))
