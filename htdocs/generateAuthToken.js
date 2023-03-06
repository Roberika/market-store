function getPrime(n) {
    let i, primes = [2, 3],
        num = 5;
    const isPrime = num => {
        let i = 1,
            p = primes[i],
            limit = Math.ceil(Math.sqrt(n));
        while (p <= limit) {
            if (num % p === 0) {
                return false;
            }
            i += 1;
            p = primes[i];
        }
        return true;
    }
    for (i = 2; i <= n; i += 1) {
        while (!isPrime(num)) {
            num += 2;
        }
        primes.push(num);
        num += 2;
    };
    return primes[n];
}

function generateUndatedAuthToken(u, p) {
    let a = 0;
    for (let t = 0; t < u.length; t++) {
        let e = u.charCodeAt(t);
        a += getPrime(t) * e;
    }
    for (let t = 0; t < p.length; t++) {
        let e = p.charCodeAt(t);
        a += getPrime(t + u.length) * e;
    }
    return a;
}

function generateAuthToken(u, p, d) {
    return (generateUndatedAuthToken(u, p) * d);
}