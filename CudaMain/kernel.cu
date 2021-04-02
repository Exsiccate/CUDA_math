
#include <thrust/device_vector.h>
#include <thrust/transform.h>
#include <thrust/sequence.h>
#include <thrust/copy.h>
#include <thrust/fill.h>
#include <thrust/replace.h>
#include <thrust/functional.h>
#include <iostream>

int main(void)
{
    // allocate three device_vectors with 10 elements
    thrust::device_vector<long> PoT(124);
    thrust::device_vector<long> Rest(124);
    thrust::device_vector<long> Twos(124);

    // fill last element with 1 
    PoT[123] = 1; 

    // fill Twos with twos
    thrust::fill(Twos.begin(), Twos.end(), 2);

    // compute Y = X mod 2
    thrust::transform(PoT.begin(), PoT.end(), Twos.begin(), Rest.begin(), thrust::multiplies<int>());

    // print X
    thrust::copy(PoT.begin(), PoT.end(), std::ostream_iterator<int>(std::cout, ","));
    // print \n
    std::cout << "\n";
    // print Z
    thrust::copy(Twos.begin(), Twos.end(), std::ostream_iterator<int>(std::cout, ","));
    // print \n
    std::cout << "\n";
    // print Z
    thrust::copy(Rest.begin(), Rest.end(), std::ostream_iterator<int>(std::cout, ","));

    return 0;
}
