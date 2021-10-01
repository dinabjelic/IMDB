using Data.EF;
using Data.EFModels;
using IMDB.ViewModels;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace IMDB.Controllers
{
    public class BroadcastCategoryController : Controller
    {
        private readonly AppDBContext _dbContext;
        private readonly ILogger<HomeController> _logger;
        private readonly IWebHostEnvironment WebHostEnvironment;

        public BroadcastCategoryController(AppDBContext dbContext, ILogger<HomeController> logger,
            IWebHostEnvironment webhostEnvironment)
        {
            _dbContext = dbContext;
            _logger = logger;
            WebHostEnvironment = webhostEnvironment;
        }
        public IActionResult ShowBroadcastCategory()
        {
            var model = new ShowBroadcastCategoryVM();
            model.Page = 1;
            model.PageSize = 10;
           
            model.FinalResult = _dbContext.BroadcastCategories
                .Where(t => t.BroadcastCategoryTypeID == 1)
                .OrderByDescending(t => t.AvgScore).Take(model.PageSize)
                .Select(d => new ShowBroadcastCategoryVM.Rows
                {
                    BroadcastCategoryID = d.BroadcastCategoryID,
                    BroadcastName = d.Title,
                    Description = d.Description,
                    ReleaseDate = d.ReleaseDate.ToString("dd.MM.yyyy"),
                    CoverImagePath = d.CoverImagePath,
                    Casts = _dbContext.BroadcastCategoryCasts.Where(x => x.BroadcastCategoryID == d.BroadcastCategoryID)
                    .Select(x => new Cast
                    {
                        CastID = x.CastID,
                        FirstName = x.Cast.FirstName,
                        LastName = x.Cast.LastName
                    
                    }).ToList(),
                  AverageReview = d.AvgScore

                }).ToList();

            model.BroadCastType = 1;
            return View(model);
        }

        public IActionResult SaveChanges(ShowBroadcastCategoryVM x)
        {
            Rating newChanges = new Rating()
            {
                BroadcastCategoryID = x.BroadcastCategoryID,
                Review = x.Review

            };
            _dbContext.Ratings.Add(newChanges);
            _dbContext.SaveChanges();

            BroadcastCategory Changes = _dbContext.BroadcastCategories.Find(x.BroadcastCategoryID);
            Changes.AvgScore = _dbContext.Ratings.Where(r => r.BroadcastCategoryID == x.BroadcastCategoryID).Average(x => x.Review);
            _dbContext.BroadcastCategories.Update(Changes);
            _dbContext.SaveChanges();

            var Findtype = Changes.BroadcastCategoryTypeID;

            if (Findtype == 1) { 
               return Redirect("ShowBroadcastCategory");
            }
            else
            {
                return Redirect("/TvSeries/ShowTvSeries");
            }
        }

        private string UploadFile(ShowBroadcastCategoryVM x)
        {
            string fileName = null;
            if (x.CoverImage != null)
            {
                string uploadDir = Path.Combine(WebHostEnvironment.WebRootPath, "Images");
                fileName = Guid.NewGuid().ToString() + "-" + x.CoverImage.FileName;
                string filePath = Path.Combine(uploadDir, fileName);
                using (var fileStream = new FileStream(filePath, FileMode.Create))
                {
                    x.CoverImage.CopyTo(fileStream);
                }
            }
            return fileName;
        }
        public IActionResult TenMoreMovies(int page)
        {
            var pageSize = 10;

            var model = new ShowBroadcastCategoryVM();
            model.Page = page;

            model.FinalResult = _dbContext.BroadcastCategories
              .Where(t => t.BroadcastCategoryTypeID == 1)
              .OrderByDescending(t => t.AvgScore).Skip((model.Page - 1) * pageSize).Take(pageSize)
              .Select(d => new ShowBroadcastCategoryVM.Rows
              {
                  BroadcastCategoryID = d.BroadcastCategoryID,
                  BroadcastName = d.Title,
                  Description = d.Description,
                  ReleaseDate = d.ReleaseDate.ToString("dd.MM.yyyy"),
                  CoverImagePath = d.CoverImagePath,
                  Casts = _dbContext.BroadcastCategoryCasts.Where(x => x.BroadcastCategoryID == d.BroadcastCategoryID)
                  .Select(x => new Cast
                  {
                      CastID = x.CastID,
                      FirstName = x.Cast.FirstName,
                      LastName = x.Cast.LastName
                  
                  }).ToList(),
                  AverageReview = d.AvgScore

              }).ToList();

           
            return View(model);
        }


        public IActionResult ShowAllShows()
        {
            List<ShowBroadcastCategoryVM.Rows> showBroadcast = _dbContext.BroadcastCategories
               .Where(t => t.BroadcastCategoryTypeID == 1)
               .OrderByDescending(t=>t.AvgScore)
               .Select(d => new ShowBroadcastCategoryVM.Rows
               {
                   BroadcastCategoryID = d.BroadcastCategoryID,
                   BroadcastName = d.Title,
                   Description = d.Description,
                   ReleaseDate = d.ReleaseDate.ToString("dd.MM.yyyy"),
                   CoverImagePath = d.CoverImagePath,
                   Casts = _dbContext.BroadcastCategoryCasts.Where(x => x.BroadcastCategoryID == d.BroadcastCategoryID)
                   .Select(x => new Cast
                   {
                       CastID = x.CastID,
                       FirstName = x.Cast.FirstName,
                       LastName = x.Cast.LastName

                   }).ToList(),
                   AverageReview = d.AvgScore

               }).ToList();


            ShowBroadcastCategoryVM d = new ShowBroadcastCategoryVM();
            d.FinalResult = showBroadcast;

            return View("ShowBroadcastCategory", d);
        }


    }
}
