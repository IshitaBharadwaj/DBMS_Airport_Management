// import { useState } from "react";
// import { useNavigate } from 'react-router-dom';

// import axios from "axios";
// import { response } from "express";

// const Test = () => {
//     const [query, setquery] = useState('');
//     const [query_resp, setquery_resp] = useState({});
//     const navigate = useNavigate();
//     const enterquery = async (e) => {
//         e.preventDefault();       
//         const newquery = {
//             query: query,

            
//             fetch(`http://localhost:3001/queries`,newquery)
//           .then((response) => response.json())
//           .then((actualData) => {
//             console.log(actualData);
//             setquery_resp(actualData);
//             console.log(query_resp);
//           })
//           .catch((err) => {
//             console.log(err.message);
//           });

//     }
// }
//     // const fetchData = () => {
//     //     fetch(`https://dummyjson.com/products`)
//     //       .then((response) => response.json())
//     //       .then((actualData) => {
//     //         console.log(actualData);
//     //         setData(actualData.products);
//     //         console.log(data);
//     //       })
//     //       .catch((err) => {
//     //         console.log(err.message);
//     //       });
//     //   };
//     return (
//         <div className="flex flex-col items-center justify-center box-border">
//             <form class="w-full max-w-lg mb-6" onSubmit={enterquery}>
//                 <div class="flex flex-wrap justify-center mb-2">
//                     <div class="w-full md:w-1/3 px-3">
//                         <label
//                             class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2"
//                             for="grid-last-name">
//                             Query
//                         </label>
//                         <input
//                             class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
//                             id="grid-last-name"
//                             type="text"
//                             placeholder="Query"
//                             value={query}
//                             onChange={(e) => setquery(e.target.value)}
//                         />
//                     </div>
//                 </div>
//                 <br />
//                 <button class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded">
//                     Query
//                 </button>
//             </form>
//             <div className="max-w-lg mt-2 ml-2">
//                 <a href="/airport"><button class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded mx-2">
//                     Go back
//                 </button></a>
//             </div>
//             {/* <div>
//                 {query_resp ?
//                     query_resp.map(resp => <div>{resp}</div>)
//                     : "No query response"
//                 }
//             </div> */}
//         </div>
//     )
// }
// export default Test;